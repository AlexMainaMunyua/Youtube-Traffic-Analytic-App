import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:youtube_analytics/Models/channel.dart';
import 'package:youtube_analytics/Models/playlist.dart';
import 'package:youtube_analytics/Models/videos.dart';
import 'package:youtube_analytics/Utilities/keys.dart';

class APIService {
  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';

  Future<Channel> fetchChannel({String channelId}) async {
    Map<String, String> parameters = {
      "part": 'snippet,contentDetails,statistics',
      'id': channelId,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    //Get Channel
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      Channel channel = Channel.fromMap(data);

      //fetch a list of uploaded playlist
      channel.playlist = await fetchPlayList(
        playlistID: channel.uploadPlaylistId,
      );

      //fetch a list of uploaded videos
      channel.videos = await fetchVideos(
        videoId: channel.uploadVideoId,
      );
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideos({String videoId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'maxResults': '8',
      'id': videoId,
      'pageToken': _nextPageToken,
      'key': API_KEY,
    };
    Uri uri = Uri.https(_baseUrl, '/youtube/v3/videos', parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'applicatio/json',
    };

    //get a list videos
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPagetoken'] ?? '';

      List<dynamic> videosJson = data['items'];

      List<Video> videos = [];
      videosJson.forEach((json) => videos.add(Video.fromMap(json['snippet'])));
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<PlayList>> fetchPlayList({String playlistID}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'id': playlistID,
      'maxResults': '8',
      'pageToken': _nextPageToken,
      'key': API_KEY
    };
    Uri uri = Uri.https(_baseUrl, '/youtube/v3/playlists', parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    //get a list of playlist
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPagetoken'] ?? '';

      List<dynamic> playlistJson = data['items'];

      //Fetch a list of playlist from the channel
      List<PlayList> playlist = [];
      playlistJson
          .forEach((json) => playlist.add(PlayList.fromMap(json['snippet'])));
      return playlist;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}
