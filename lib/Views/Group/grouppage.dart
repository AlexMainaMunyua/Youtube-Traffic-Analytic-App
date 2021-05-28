import 'package:flutter/material.dart';
import 'package:youtube_analytics/Views/Group/widgets/groupgraph.dart';

class GroupPage extends StatelessWidget {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget videoButton = FlatButton(
      child: Text("Video"),
      onPressed: () {},
    );
    Widget playlistButton = FlatButton(
      child: Text("Playlist"),
      onPressed: () {},
    );
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Group's Name"),
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(hintText: 'eg. Augast videos'),
            ),
          )
        ],
      ),
      actions: [
        videoButton,
        playlistButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => GroupGraph());

                    Navigator.push(context, route);
                  },
                  title: Text("Group name"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                  ),
                ),
                Divider()
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}
