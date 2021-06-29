import 'package:youtube_analytics/src/Models/playlist.dart';
import 'package:youtube_analytics/src/Models/videos.dart';

class Channel {
  final String id;
  final String title;
  final String description;
  final String profilePictureUrl;
  final String subscriberCount;
  final String videoCount;
  final String customUrl;
  final String uploadPlaylistId;
  final String publishedAt;
  final String uploadVideoId;
  List<Video> videos;
  List<PlayList> playlist;

  Channel({
    this.id,
    this.title,
    this.description,
    this.profilePictureUrl,
    this.subscriberCount,
    this.videoCount,
    this.publishedAt,
    this.customUrl,
    this.uploadPlaylistId,
    this.videos,
    this.uploadVideoId,
  });

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      id: map['id'],
      title: map['snippet']['title'],
      description: map['snippet']['description'] ?? " ",
      profilePictureUrl: map['snippet']['thumbnails']['default']['url'],
      subscriberCount: map['statistics']['subscriberCount'],
      publishedAt: map['snippet']['publishedAt']??" ",
      videoCount: map['statistics']['videoCount'],
      customUrl: map['snippet']['customUrl'] ?? " ",
      uploadPlaylistId: map['contentDetails']['relatedPlaylists']['uploads'],
      uploadVideoId: map['contentDetails']['relatedPlaylists']['uploads'],
    );
  }
}
