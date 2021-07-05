import 'package:flutter/material.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_analytics/src/state/channelState.dart';
import 'package:dropdown_below/dropdown_below.dart';

class VideoPage extends ConsumerWidget {
  // final String _selectVideo;
  final List<Feature> features = [
    Feature(
      title: "Flutter",
      color: Colors.blue,
      data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
    ),
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final video = watch(channelProviderByID);
    final category = watch(videoProvider).videoCategory;
    return Scaffold(
        body: video.when(
            data: (data) => ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownBelow(
                        value: category,
                        // isDense: true,
                        itemWidth: MediaQuery.of(context).size.width * 0.92,
                        itemTextstyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        boxTextstyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade600),
                        boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
                        boxWidth: MediaQuery.of(context).size.width,
                        boxHeight: 60,
                        hint: Text('choose video'),
                        items: video.data.value.videos
                            .map((e) => DropdownMenuItem(
                                  onTap: () => e.title,
                                  value: e.title ?? category,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.title ?? '$category',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (video) {
                          context.read(videoProvider).cateroryOnChange(video);
                        },
                      ),
                    ),
                  ],
                ),
            loading: () => CircularProgressIndicator(),
            error: (e, s) => Text('$e')));

    // return Scaffold(
    //   body: ListView(
    //     children: [

    //       Container(
    //         color: Colors.grey.shade200,
    //         height: 50.0,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Padding(
    //               padding:
    //                   const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
    //               child: Align(
    //                   alignment: Alignment.centerLeft,
    //                   child: Text(
    //                     "Views graph",
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.w400,
    //                     ),
    //                   )),
    //             ),
    //             Container(
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.all(Radius.circular(30)),
    //                 ),
    //                 margin: EdgeInsets.all(10.0),
    //                 padding: EdgeInsets.all(5.0),
    //                 width: MediaQuery.of(context).size.width * 0.40,
    //                 child: Padding(
    //                     padding: EdgeInsets.only(left: 8.0, right: 8.0),
    //                     child: DropdownButtonHideUnderline(
    //                         child: DropdownButton(
    //                       isExpanded: false,
    //                       hint: Text("Views"),
    //                     ))))
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: LineGraph(
    //           features: features,
    //           size: Size(420, 450),
    //           labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
    //           labelY: ['25%', '45%', '65%', '75%', '85%', '100%'],
    //           showDescription: true,
    //           graphColor: Colors.grey,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
