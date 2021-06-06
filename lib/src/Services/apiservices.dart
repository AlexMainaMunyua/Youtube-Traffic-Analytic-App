import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:youtube_analytics/src/Models/channel.dart';
import 'package:youtube_analytics/src/Models/playlist.dart';
import 'package:youtube_analytics/src/Models/videos.dart';
import 'package:youtube_analytics/src/Utilities/keys.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

// const AUTH_ENDIPOINT = 'https://accounts.google.com/o/oauth2/auth';
// const CLIENT_ID =
//     '617723282592-hmrkv914m2j26tk2vo4e7dt5ccs3ol5t.apps.googleusercontent.com';
// const REDIRECT_URI = 'my.test.app';
// const TOKEN_ENDPOINT = 'https://oauth2.googleapis.com/token';
// var scopes = [
//   'https://www.googleapis.com/auth/youtube.readonly',
//   'https://www.googleapis.com/auth/yt-analytics.readonly',
//   'https://www.googleapis.com/auth/yt-analytics-monetary.readonly',
//   'https://www.googleapis.com/auth/youtube.readonly'
// ];

// var httpClient = http.Client();

class APIService {
  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';

  FlutterAppAuth appAuth = FlutterAppAuth();

  Future<Channel> fetchChannel({String channelId}) async {
    GoogleOAuth2Client client = GoogleOAuth2Client(
         customUriScheme: 'com.example.youtube_analytics',redirectUri: 'com.example.youtube_analytics:/oauth2redirect');

    // OAuth2Helper oAuth2Helper = OAuth2Helper(client,
    //     grantType: OAuth2Helper.AUTHORIZATION_CODE,
    //     clientId:
    //         '617723282592-hmrkv914m2j26tk2vo4e7dt5ccs3ol5t.apps.googleusercontent.com',
    //     scopes: [
    //       'https://www.googleapis.com/auth/youtube.readonly',
    //       'https://www.googleapis.com/auth/yt-analytics.readonly',
    //       'https://www.googleapis.com/auth/yt-analytics-monetary.readonly',
    //       'https://www.googleapis.com/auth/youtube.readonly'
    //     ]);
    AccessTokenResponse tknResp = await client.getTokenWithAuthCodeFlow(
        clientId:
            '617723282592-hmrkv914m2j26tk2vo4e7dt5ccs3ol5t.apps.googleusercontent.com',
        scopes: [
          'https://www.googleapis.com/auth/youtube.readonly',
          'https://www.googleapis.com/auth/yt-analytics.readonly',
          'https://www.googleapis.com/auth/yt-analytics-monetary.readonly',
          'https://www.googleapis.com/auth/youtube.readonly'
        ]);
    // final AuthorizationTokenResponse result =
    //     await appAuth.authorizeAndExchangeCode(AuthorizationTokenRequest(
    //         CLIENT_ID, REDIRECT_URI,
    //         serviceConfiguration: AuthorizationServiceConfiguration(
    //             AUTH_ENDIPOINT, TOKEN_ENDPOINT),
    //         scopes: scopes));

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
    // var response = await http.get(uri, headers: headers);

    var httpClient = http.Client();

    http.Response response = await httpClient.get(uri,
        headers: {'Authorization': 'Bearer' + tknResp.accessToken});

    // http.Response response = await oAuth2Helper.get('$uri', headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      Channel channel = Channel.fromMap(data);

      channel.videos = await fetchVideosFromPlaylist(
        playlistId: channel.uploadPlaylistId,
      );

      //fetch a list of uploaded playlist
      // channel.playlist = await fetchPlayList(
      //   channelId: chan,
      // );

      //fetch a list of uploaded videos
      // channel.videos = await fetchVideos(
      //   videoId: channel.uploadVideoId,
      // );
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideosFromPlaylist({String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '8',
      'pageToken': _nextPageToken,
      'key': API_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    //get Playlist Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPagetoken'] ?? '';
      List<dynamic> videosJson = data['items'];

      //Fetch first eight videos from uploads playlist
      List<Video> videos = [];
      videosJson.forEach(
        (json) => videos.add(
          Video.fromMap(json['snippet']),
        ),
      );
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<PlayList>> fetchPlayList({String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails',
      'channelId': channelId,
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
