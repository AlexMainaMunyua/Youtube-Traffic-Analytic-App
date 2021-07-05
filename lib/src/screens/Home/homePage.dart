import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_analytics/src/state/channelState.dart';

import 'widgets/keytext.dart';
import 'widgets/subtext.dart';

class HomePage extends ConsumerWidget {
  final String id = 'UCcw05gGzjLIs5dnxGkQHMvw';

  @override
  Widget build(BuildContext context, watch) {
    final channelProvider = watch(channelProviderByID);

    return Scaffold(
        body: Center(
      child: channelProvider.when(
        data: (data) => ListView(
          children: [
            _buildChannelProfile(data),
            _buildChannelDetails(data),
          ],
        ),
        loading: () => CircularProgressIndicator(),
        error: (e, s) => Text('$e'),
      ),
    ));
  }

  _buildChannelProfile(data) {
    return Container(
      margin: EdgeInsets.only(right: 20.0, left: 20, top: 20),
      padding: EdgeInsets.only(right: 20.0, left: 20, top: 20),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(data.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${data.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildChannelDetails(data) {
    return Container(
      margin: EdgeInsets.only(right: 20.0, left: 20, top: 20),
      padding: EdgeInsets.only(right: 20.0, left: 20, top: 20),
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Table(
        children: [
          TableRow(children: [
            KeyText(
              msg: 'Description:',
            ),
            SubText(
              msg: data.description,
            )
          ]),
          TableRow(children: [
            KeyText(
              msg: 'Number of videos:',
            ),
            SubText(
              msg: data.videoCount,
            )
          ]),
          TableRow(children: [
            KeyText(
              msg: 'Custom Link:',
            ),
            SubText(
              msg: data.customUrl,
            )
          ]),
           TableRow(children: [
            KeyText(
              msg: 'Published at:',
            ),
            SubText(
              msg: data.publishedAt,
            )
          ]),
        ],
      ),
    );
  }
}
