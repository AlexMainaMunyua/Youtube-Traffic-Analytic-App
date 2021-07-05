import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_analytics/src/Models/channel.dart';
import 'package:youtube_analytics/services/services.dart';

//Api Provider
// final apiProvider = Provider((_) => APIService());

//Channel ID provider
final channelIdProvider = Provider((ref) => 'UCcw05gGzjLIs5dnxGkQHMvw');

//Channel Provider
final channelProviderByID = FutureProvider<Channel>((ref) {
  final channelId = ref.watch(channelIdProvider);

  // final data = ref.watch(apiProvider);

  // return data.fetchChannel(channelId);
});



//Video Provider
final videoProvider =
    ChangeNotifierProvider<VideoProvider>((ref) => VideoProvider());

class VideoProvider extends ChangeNotifier {
  String _videoCategory;

  String get videoCategory => _videoCategory;

  cateroryOnChange(String value) {
    if (value.isEmpty) {
      return _videoCategory;
    }
    _videoCategory = value;

    return notifyListeners();
  }
}

//Playlist Provider
