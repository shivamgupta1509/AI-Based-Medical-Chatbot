import 'package:flutter/material.dart';
import 'package:medical_chatbot/models/user.dart';
import 'package:medical_chatbot/screens/authenticate/create_account/createStepper.dart';
import 'package:medical_chatbot/screens/wrapper.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:medical_chatbot/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:medical_chatbot/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        // home: CreateUser(),
      ),
    );
  }
}
