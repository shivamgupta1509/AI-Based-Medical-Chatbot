import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_chatbot/screens/home/home.dart';
import 'package:medical_chatbot/screens/wrapper.dart';
import 'package:medical_chatbot/services/auth.dart';
import 'package:medical_chatbot/shared/loading.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
  bool loading = false;

  String fname = '';
  String lname = '';
  String email = '';
  String pasword = '';
  String cpassword = '';
  String error = '';

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
          child: ListView(children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
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
                fontSize: 20,
                fontFamily: 'Zendots',
                color: Colors.cyan,
                decoration: TextDecoration.underline,
                decorationThickness: 2.5,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Register',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Orbitron',
                color: Colors.green,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 15.0,),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline_rounded,
                          size: 40.0,
                        ),
                        Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter First Name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() => fname = val);
                              },
                          )
                        ),
                        Container(width: 5.0,),
                        Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Last Name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() => lname = val);
                              },
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          size: 40.0,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email Address';
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.vpn_key_outlined,
                          size: 40.0,
                        ),
                        Container(width: 2.0,),
                        Expanded(
                          child: TextFormField(
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() => pasword = val);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Icon(
                          Icons.vpn_key_sharp,
                          size: 40.0,
                        ),
                        Container(width: 2.0,),
                        Expanded(
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Confirm Password';
                              }
                              if (value != pasword){
                                return 'Password Does Not Match';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() => cpassword = val);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
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
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        onPrimary: Colors.blue,
                        elevation: 5,
                        shadowColor: Colors.blue,
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      icon: Icon(Icons.subdirectory_arrow_right),
                      onPressed: () async {
                        // if (_formKey.currentState.validate()) {
                        //   setState(() {
                        //     loading = true;
                        //   });
                        //   dynamic result = await _auth.registerWithEmailAndPassword(email, pasword, fname, lname);
                        //   if (result == null){
                        //     setState(() {
                        //       error = 'Something Goes wrong...';
                        //       loading = false;
                        //     });
                        //   } else{
                        //     Navigator.pop(context);
                        //   }
                        // }
                      },
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
