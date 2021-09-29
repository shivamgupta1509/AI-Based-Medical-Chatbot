import'package:flutter/material.dart';
import 'package:medical_chatbot/models/user.dart';
import 'package:medical_chatbot/screens/authenticate/authenticate.dart';
import 'package:medical_chatbot/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser>(context);
    // print('wrapper');
    // print(user);

    if(user == null){
      return Authenticate();
    }else{
      return Home(user);
    }
  }
}
