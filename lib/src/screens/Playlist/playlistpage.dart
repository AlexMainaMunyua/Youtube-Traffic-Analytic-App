import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Feature> features = [
      // Feature(
      //   title: "Flutter",
      //   color: Colors.blue,
      //   data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
      // ),
      // Feature(
      //   title: "Kotlin",
      //   color: Colors.black,
      //   data: [1, 0.8, 0.6, 0.7, 0.3, 0.1],
      // ),
      Feature(
        title: "View",
        color: Colors.orange,
        data: [0.4, 0.2, 0.9, 0.5, 0.6, 0.4],
      ),
      // Feature(
      //   title: "React Native",
      //   color: Colors.red,
      //   data: [0.5, 0.2, 0, 0.3, 1, 1.3],
      // ),
      // Feature(
      //   title: "Swift",
      //   color: Colors.green,
      //   data: [0.25, 0.6, 1, 0.5, 0.8, 1, 4],
      // ),
    ];
    // return Scaffold(
    //         body: video.when(
    //         data: (data) => ListView(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: DropdownBelow(
    //                     value: category,
    //                     // isDense: true,
    //                     itemWidth: MediaQuery.of(context).size.width * 0.92,

    //                     itemTextstyle: TextStyle(
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.w400,
    //                         color: Colors.black),
    //                     boxTextstyle: TextStyle(
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.w400,
    //                         color: Colors.grey.shade600),
    //                     boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
    //                     boxWidth: MediaQuery.of(context).size.width,
    //                     boxHeight: 60,
    //                     hint: Text('choose video'),
    //                     items: video.data.value.videos
    //                         .map((e) => DropdownMenuItem(
    //                               onTap: () => e.title,
    //                               value: e.title ?? category,
    //                               child: Container(
    //                                 width: double.infinity,
    //                                 decoration: BoxDecoration(),
    //                                 child: Padding(
    //                                   padding: const EdgeInsets.all(8.0),
    //                                   child: Text(
    //                                     e.title ?? '$category',
    //                                     overflow: TextOverflow.ellipsis,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ))
    //                         .toList(),
    //                     onChanged: (video) {
    //                       context.read(videoProvider).cateroryOnChange(video);
    //                     },
    //                   ),
    //                 ),
    //               ],
    //             ),
    //         loading: () => CircularProgressIndicator(),
    //         error: (e, s) => Text('$e'))
      // body: ListView(
      //   children: [
      //     Container(
      //       height: 40.0,
      //       child: Padding(
      //         padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      //         child: Align(
      //             alignment: Alignment.centerLeft,
      //             child: Text(
      //               "Select a playlist",
      //               style: TextStyle(
      //                 fontWeight: FontWeight.w400,
      //               ),
      //             )),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           border: Border.all(color: Colors.grey),
      //           borderRadius: BorderRadius.circular(10.0),
      //         ),
      //         child: DropdownButtonHideUnderline(
      //             child: ClipRRect(
      //           borderRadius: BorderRadius.circular(10.0),
      //           child: Container(
      //               clipBehavior: Clip.antiAlias,
      //               decoration: BoxDecoration(),
      //               child: DropdownButtonFormField(
      //                 decoration: InputDecoration(
      //                     contentPadding: EdgeInsets.only(
      //                         top: 8.0, bottom: 20.0, right: 8.0, left: 8.0),
      //                     fillColor: Colors.white,
      //                     border: InputBorder.none,
      //                     filled: true,
      //                     labelText: 'Tila',
      //                     labelStyle: TextStyle(
      //                       color: Colors.grey,
      //                       fontSize: 13.0,
      //                       letterSpacing: 0.3,
      //                     )),
      //                 isExpanded: true,
      //                 isDense: true,
      //               )),
      //         )),
      //       ),
      //     ),
      //     Container(
      //       color: Colors.grey.shade200,
      //       height: 50.0,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Padding(
      //             padding:
      //                 const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
      //             child: Align(
      //                 alignment: Alignment.centerLeft,
      //                 child: Text(
      //                   "Views graph",
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w400,
      //                   ),
      //                 )),
      //           ),
      //           Container(
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.all(Radius.circular(30)),
      //               ),
      //               margin: EdgeInsets.all(10.0),
      //               padding: EdgeInsets.all(5.0),
      //               width: MediaQuery.of(context).size.width * 0.40,
      //               child: Padding(
      //                   padding: EdgeInsets.only(left: 8.0, right: 8.0),
      //                   child: DropdownButtonHideUnderline(
      //                       child: DropdownButton(
      //                     // items: _dropdownValues
      //                     //     .map((value) => DropdownMenuItem(
      //                     //         child: Text(value), value: value))
      //                     //     .toList(),
      //                     // onChanged: (String value) {
      //                     //   setState(() {
      //                     //     _currentlySelected = value;
      //                     //   });
      //                     // },
      //                     isExpanded: false,
      //                     hint: Text("Views"),
      //                     // value: _currentlySelected,
      //                   ))))
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: LineGraph(
      //         features: features,
      //         size: Size(420, 450),
      //         labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
      //         labelY: ['25%', '45%', '65%', '75%', '85%', '100%'],
      //         showDescription: true,
      //         graphColor: Colors.grey,
      //       ),
      //     ),
      //   ],
      // ),
    // );
  }
}
