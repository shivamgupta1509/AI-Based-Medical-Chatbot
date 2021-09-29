import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_chatbot/screens/home/home.dart';
import 'package:medical_chatbot/screens/wrapper.dart';
import 'package:medical_chatbot/services/auth.dart';
import 'package:medical_chatbot/shared/loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

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
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage("images/medbot2.png"),
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        Text(
                          "_MyMedBot_",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Zendots',
                            fontWeight: FontWeight.w700,
                            color: Colors.red[700],
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Vertical Line
                  Container(
                    margin: EdgeInsets.fromLTRB(2, 3, 10, 0),
                    width: 3,
                    height: 150,
                    decoration: ShapeDecoration(
                        color: Colors.black26,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 75),
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'Orbitron',
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w900,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ),
                          icon: const Icon(
                            Icons.person_outline_rounded,
                            size: 40.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value.length < 6) {
                            return 'Please Enter Password having at least 6 letter';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ),
                          icon: const Icon(
                            Icons.vpn_key_outlined,
                            size: 40.0,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      Text(
                          error,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      SizedBox(height: 10.0,),
                      ElevatedButton.icon(
                        label: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          onPrimary: Colors.white,
                          elevation: 5,
                          shadowColor: Colors.blue,
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        icon: Icon(Icons.login_sharp),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                            if (result == null){
                              setState(() {
                                error = 'Something Goes wrong...';
                                loading = false;
                              });
                            } else{
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Wrapper()),
                                Navigator.pop(context);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
