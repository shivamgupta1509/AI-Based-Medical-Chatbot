import 'package:flutter/material.dart';
// import 'package:medical_chatbot/screens/authenticate/create.dart';
import 'package:medical_chatbot/screens/authenticate/create_account/createStepper.dart';
import 'package:medical_chatbot/services/auth.dart';
import 'package:medical_chatbot/shared/loading.dart';
import 'signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Container(
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
            SizedBox(height: 30.0,),
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage("images/medbot2.png"),
                width: 175.0,
                height: 175.0,
              ),
            ),
            Text(
              "_MyMedBot_",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Zendots',
                color: Colors.redAccent,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.blueGrey,
                    offset: Offset(10.0, 10.0),
                  ),
                ],
                decoration: TextDecoration.underline,
                decorationThickness: 2.5,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
              child: ElevatedButton.icon(
                  label: Text(
                    'Guest Login',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.blue,
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  icon: Icon(Icons.person_pin_circle),
                  onPressed: () async{
                    setState(() {
                      loading = true;
                    });
                    print("Guest Press");
                    dynamic result = await _auth.signInAnon();
                    if(result == null){
                      print('error in signin');
                      setState(() {
                        loading = false;
                      });
                    }
                    // else{
                    //   print('Signed In');
                    //   print(result.uid);
                    // }
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 90.0),
              child: ElevatedButton.icon(
                  label: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.blue,
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  icon: Icon(Icons.login_sharp),
                  onPressed: () {
                    print("Press");
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 95.0),
              child: ElevatedButton.icon(
                  label: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    onPrimary: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.blue,
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  icon: Icon(Icons.account_box),
                  onPressed: () {
                    print("Press");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateUser()),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

