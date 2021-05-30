import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_analytics/state/channelState.dart';


class HomePage extends ConsumerWidget {

  final String id = 'UCcw05gGzjLIs5dnxGkQHMvw';

  @override
  Widget build(BuildContext context, watch) {
    final channelProvider = watch(channelDataByID(id));

    return Scaffold(
        body: Center(
      child: channelProvider.when(
        data: (data) => Text(data.title),
        loading: () => CircularProgressIndicator(),
        error: (e, s) => Text('$e'),
      ),
    ));
  }
}
