import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class GroupGraph extends StatefulWidget {
  @override
  _GroupGraphState createState() => _GroupGraphState();
}

class _GroupGraphState extends State<GroupGraph> {
  final List<Feature> features = [
    Feature(
      title: "Flutter",
      color: Colors.blue,
      data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
    ),
    Feature(
      title: "React Native",
      color: Colors.red,
      data: [0.5, 0.2, 0, 0.3, 1, 1.3],
    ),
    Feature(
      title: "Swift",
      color: Colors.green,
      data: [0.25, 0.6, 1, 0.5, 0.8, 1, 4],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Group",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
          IconButton(icon: Icon(Icons.edit), onPressed: () {}),
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              color: Colors.grey.shade200,
              height: 40.0,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Name of the group",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "No. of items:",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )),
            ),
            Container(
              color: Colors.grey.shade200,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.filter_list),
                      ),
                      Container(
                          margin: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                              // items: _dropdownValues
                              //     .map((value) => DropdownMenuItem(
                              //         child: Text(value), value: value))
                              //     .toList(),
                              // onChanged: (String value) {
                              //   setState(() {
                              //     _currentlySelected = value;
                              //   });
                              // },
                              isExpanded: false,
                              hint: Text(
                                "Country",
                                style: TextStyle(fontSize: 13),
                              ),
                              // value: _currentlySelected,
                            )),
                          )),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                            // items: _dropdownValues
                            //     .map((value) => DropdownMenuItem(
                            //         child: Text(value), value: value))
                            //     .toList(),
                            // onChanged: (String value) {
                            //   setState(() {
                            //     _currentlySelected = value;
                            //   });
                            // },
                            isExpanded: false,
                            hint: Text(
                              "Views",
                              style: TextStyle(fontSize: 13),
                            ),
                            // value: _currentlySelected,
                          )))),
                ],
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
      ),
    );
  }
}
