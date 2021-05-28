import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Feature> features = [
      Feature(
        title: "Flutter",
        color: Colors.blue,
        data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
      ),
      // Feature(
      //   title: "Kotlin",
      //   color: Colors.black,
      //   data: [1, 0.8, 0.6, 0.7, 0.3, 0.1],
      // ),
      // Feature(
      //   title: "Java",
      //   color: Colors.orange,
      //   data: [0.4, 0.2, 0.9, 0.5, 0.6, 0.4],
      // ),
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
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 40.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select a video",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButtonHideUnderline(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 8.0, bottom: 20.0, right: 8.0, left: 8.0),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          filled: true,
                          labelText: 'Tila',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.0,
                            letterSpacing: 0.3,
                          )),
                      isExpanded: true,
                      isDense: true,
                    )),
              )),
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            height: 40.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Views graph",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LineGraph(
              features: features,
              size: Size(420, 450),
              labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
              labelY: ['25%', '45%', '65%', '75%', '85%', '100%'],
              showDescription: true,
              graphColor: Colors.grey,
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.orange,

        /// both default to 16
        marginEnd: 18,
        marginBottom: 20,
        icon: Icons.add,
        activeIcon: Icons.remove,

        visible: true,

        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.3,

        elevation: 8.0,

        gradientBoxShape: BoxShape.circle,

        children: [
          SpeedDialChild(
            child: Icon(
              Icons.view_agenda,
              color: Colors.orange,
              size: 14,
            ),
            label: 'Views',
            onTap: () => print('FIRST CHILD'),
          ),
          SpeedDialChild(
            child: Icon(
              Icons.favorite,
              color: Colors.orange,
              size: 14,
            ),
            label: 'Likes',
            onTap: () => print('SECOND CHILD'),
          ),
        ],
      ),
    );
  }
}
