import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_analytics/Models/channel.dart';
import 'package:youtube_analytics/Services/apiservices.dart';

final apiChannelProvider = Provider((_) => APIService());


final channelDataByID = FutureProvider.family<Channel, String>((ref, id) {
  final data = ref.watch(apiChannelProvider);
  return data.fetchChannel(channelId: id);
});
