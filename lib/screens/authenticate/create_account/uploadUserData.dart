import 'package:flutter/material.dart';
import 'dart:collection';

class UploadUserData extends StatefulWidget {

  @override
  _UploadUserDataState createState() => _UploadUserDataState();
}

class _UploadUserDataState extends State<UploadUserData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.help_outline,
            size: 30.0,
            color: Colors.redAccent,
          ),
          Container(width: 10.0,),
          Expanded(
            child: Text(
              'Are you Sure, the Entered data are Correct? And want to save...',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
