// import 'package:draw_graph/draw_graph.dart';
// import 'package:draw_graph/models/feature.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/all.dart';
// import 'package:youtube_analytics/Models/channel.dart';
// import 'package:youtube_analytics/Models/videos.dart';
// import 'package:youtube_analytics/Services/apiservices.dart';
// import 'package:youtube_analytics/state/channelState.dart';

// class _HomePageState extends ConsumerWidget {
//   Channel _channel;
//   bool _isLoading = false;

//   _initChannel() async {
//     Channel channel = await APIService.instance
//         .fetchChannel(channelId: 'UCcw05gGzjLIs5dnxGkQHMvw');
//     setState(() {
//       _channel = channel;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     _initChannel();
//   }

//   _buildProfileInfo() {
//     return Container(
//       margin: EdgeInsets.only(right: 20.0, left: 20, top: 20),
//       padding: EdgeInsets.only(right: 20.0, left: 20, top: 20),
//       height: 100.0,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             offset: Offset(0, 1),
//             blurRadius: 6.0,
//           ),
//         ],
//       ),
//       child: Row(
//         children: <Widget>[
//           CircleAvatar(
//             backgroundColor: Colors.white,
//             radius: 35.0,
//             backgroundImage: NetworkImage(_channel.profilePictureUrl),
//           ),
//           SizedBox(width: 12.0),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   _channel.title,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   '${_channel.subscriberCount} subscribers',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   _buildChannelDetail() {
//     return Container(
//       margin: EdgeInsets.only(right: 20.0, left: 20, top: 20),
//       padding: EdgeInsets.only(right: 20.0, left: 20, top: 20),
//       height: 300.0,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             offset: Offset(0, 1),
//             blurRadius: 6.0,
//           ),
//         ],
//       ),
//     );
//   }

//   _buildVideo(Video video) {
//     return GestureDetector(
//       // onTap: () => Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (_) => VideoScreen(id: video.id),
//       //   ),
//       // ),
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//         padding: EdgeInsets.all(10.0),
//         height: 140.0,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               offset: Offset(0, 1),
//               blurRadius: 6.0,
//             ),
//           ],
//         ),
//         child: Row(
//           children: <Widget>[
//             Image(
//               width: 150.0,
//               image: NetworkImage(video.thumbnailUrl),
//             ),
//             SizedBox(width: 10.0),
//             Expanded(
//               child: Text(
//                 video.title,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _loadMoreVideos() async {
//     _isLoading = true;
//     List<Video> moreVideos = await APIService.instance
//         .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
//     List<Video> allVideos = _channel.videos..addAll(moreVideos);
//     setState(() {
//       _channel.videos = allVideos;
//     });
//     _isLoading = false;
//   }

//   final List<Feature> features = [
//     // Feature(
//     //   title: "Flutter",
//     //   color: Colors.blue,
//     //   data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
//     // ),
//     // Feature(
//     //   title: "Kotlin",
//     //   color: Colors.black,
//     //   data: [1, 0.8, 0.6, 0.7, 0.3, 0.1],
//     // ),
//     // Feature(
//     //   title: "View",
//     //   color: Colors.orange,
//     //   data: [0.4, 0.2, 0.9, 0.5, 0.6, 0.4],
//     // ),
//     // Feature(
//     //   title: "React Native",
//     //   color: Colors.red,
//     //   data: [0.5, 0.2, 0, 0.3, 1, 1.3],
//     // ),
//     Feature(
//       title: "Swift",
//       color: Colors.green,
//       data: [0.25, 0.6, 1, 0.5, 0.8, 1, 4],
//     ),
//   ];

//   _buildGraph() {
//     return Container(
//       margin: EdgeInsets.only(right: 2.0, top: 20),
//       // padding: EdgeInsets.only(top: 20),
//       //   height: 500.0,
//       //   decoration: BoxDecoration(
//       //     color: Colors.white,
//       //     boxShadow: [
//       //       BoxShadow(
//       //         color: Colors.black12,
//       //         offset: Offset(0, 1),
//       //         blurRadius: 6.0,
//       //       ),
//       //     ],
//       //   ),
//       child: LineGraph(
//         features: features,
//         size: Size(420, 450),
//         labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
//         labelY: ['25%', '45%', '65%', '75%', '85%', '100%'],
//         showDescription: true,
//         graphColor: Colors.grey,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context, watch) {
//     final channel = watch(channelData);
//     // return Scaffold(
//     //   body: _channel != null
//     //       ? NotificationListener<ScrollNotification>(
//     //           onNotification: (ScrollNotification scrollDetails) {
//     //             if (!_isLoading &&
//     //                 _channel.videos.length != int.parse(_channel.videoCount) &&
//     //                 scrollDetails.metrics.pixels ==
//     //                     scrollDetails.metrics.maxScrollExtent) {
//     //               // _loadMoreVideos();
//     //             }
//     //             return false;
//     //           },
//     //           child: ListView.builder(
//     //             itemCount: 1 + _channel.videos.length,
//     //             itemBuilder: (BuildContext context, int index) {
//     //               if (index == 0) {
//     //                 return _buildProfileInfo();
//     //               }
//     //               Video video = _channel.videos[index - 1];
//     //               return _buildVideo(video);
//     //             },
//     //           ))
//     //       : Center(
//     //           child: CircularProgressIndicator(
//     //             valueColor: AlwaysStoppedAnimation<Color>(
//     //               Theme.of(context).primaryColor, // Red
//     //             ),
//     //           ),
//     //         ),
//     // );
//     return Scaffold(
//       body: Container(
//           child: ListView(
//         children: [
//           _buildProfileInfo(),
//           _buildChannelDetail(),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             color: Colors.grey.shade200,
//             height: 50.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Views graph",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                         ),
//                       )),
//                 ),
//                 Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     margin: EdgeInsets.all(10.0),
//                     padding: EdgeInsets.all(5.0),
//                     width: MediaQuery.of(context).size.width * 0.40,
//                     child: Padding(
//                         padding: EdgeInsets.only(left: 8.0, right: 8.0),
//                         child: DropdownButtonHideUnderline(
//                             child: DropdownButton(
//                           // items: _dropdownValues
//                           //     .map((value) => DropdownMenuItem(
//                           //         child: Text(value), value: value))
//                           //     .toList(),
//                           // onChanged: (String value) {
//                           //   setState(() {
//                           //     _currentlySelected = value;
//                           //   });
//                           // },
//                           isExpanded: false,
//                           hint: Text("Views"),
//                           // value: _currentlySelected,
//                         ))))
//               ],
//             ),
//           ),
//           _buildGraph()
//         ],
//       )),
//     );
//   }
// }
