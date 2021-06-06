import 'package:flutter/material.dart';

class SubText extends StatelessWidget {
  final String msg;

  const SubText({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
       Padding(
        padding: const EdgeInsets.only(bottom:4.0, right: 4.0 , top: 4.0),
        child: Text(
          msg,
          style: TextStyle(
              color: Colors.black, wordSpacing: 2,fontWeight: FontWeight.w200, fontSize: 14),
        ),
      
    );
  }
}
