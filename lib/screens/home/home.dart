import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:medical_chatbot/models/user.dart';
import 'package:medical_chatbot/screens/bot/disclaimer.dart';
import 'package:medical_chatbot/services/auth.dart';
import 'package:medical_chatbot/shared/loading.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:medical_chatbot/services/database.dart';
// import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final CustomUser currentUser;
  Home(this.currentUser);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var currentUid = widget.currentUser.uid;
    var currentEmail = widget.currentUser.email;
    // print(currentUid);
    // print("----");
    // print(currentEmail);
    if(currentEmail == null){
      currentEmail ="Guest";
    }
    // print(currentEmail);

    return loading
        ? Loading()
        : Container(
            decoration: const BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.65, 1.0],
                colors: const <Color>[Color(0xff99D9D1), Color(0xffffffff)],
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView(
                children: [
                  SizedBox(
                    height: 65.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,10,10,5),
                            child: Text(
                              'Welcome $currentEmail !',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            await _auth.signOut();
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'LogOut ',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.logout,
                                    size: 25.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Horizontal Line
                  Padding(
                    padding:EdgeInsets.fromLTRB(10,0,10,15),
                    child:Container(
                      height:2.0,
                      color:Colors.teal,
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("images/medbot2.png"),
                      width: 125.0,
                      height: 125.0,
                    ),
                  ),
                  Text(
                    "_MyMedBot_",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Zendots',
                      color: Colors.redAccent,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.blueGrey,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.5,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage("images/bot.png"),
                              width: 150.0,
                              height: 150.0,
                            ),
                            SizedBox(height: 5.0,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.greenAccent,
                                onPrimary: Colors.indigo,
                                padding: EdgeInsets.all(10.0),
                                textStyle: TextStyle(
                                  fontSize: 20.0,
                                  letterSpacing: 3.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Orbitron',
                                ),
                                minimumSize: Size(150.0, 40.0),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Disclaimer()),
                                );
                              },
                              child: Text('MEDIBOT'),
                            )
                          ],
                        ),
                      ),
                      // Vertical Line
                      Container(
                        margin: EdgeInsets.fromLTRB(2,5,2,5),
                        width: 10,
                        height: 150,
                        decoration: ShapeDecoration(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage("images/report.png"),
                              width: 150.0,
                              height: 150.0,
                            ),
                            SizedBox(height: 5.0,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.greenAccent,
                                onPrimary: Colors.indigo,
                                padding: EdgeInsets.all(10.0),
                                textStyle: TextStyle(
                                  fontSize: 20.0,
                                  letterSpacing: 3.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Orbitron',
                                ),
                                minimumSize: Size(150.0, 40.0),
                              ),
                              onPressed: () {},
                              child: Text('REPORT'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage("images/update.png"),
                              width: 150.0,
                              height: 150.0,
                            ),
                            SizedBox(height: 5.0,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.greenAccent,
                                onPrimary: Colors.indigo,
                                padding: EdgeInsets.all(10.0),
                                textStyle: TextStyle(
                                  fontSize: 20.0,
                                  letterSpacing: 3.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Orbitron',
                                ),
                                minimumSize: Size(150.0, 40.0),
                              ),
                              onPressed: () {},
                              child: Text('MEDICAL INFO'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding:EdgeInsets.fromLTRB(10,5,10,3),
                    child:Container(
                      height:2.0,
                      color:Colors.green,
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.fromLTRB(50,3,50,15),
                    child:Container(
                      height:2.0,
                      color:Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          );
  }
}
