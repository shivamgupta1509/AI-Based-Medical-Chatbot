import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountCreate extends StatefulWidget {
  @override
  AccountCreateState createState() => AccountCreateState();
}

class AccountCreateState extends State<AccountCreate> {
  static final formKey = GlobalKey<FormState>();
  static TextEditingController controllerEmailId = new TextEditingController();
  static TextEditingController controllerPassword = new TextEditingController();
  static TextEditingController controllerConfirmPassword =
      new TextEditingController();
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Form(
        key: formKey,
        child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.mail_outline,
                    size: 40.0,
                  ),
                  Container(width: 10,),
                  Expanded(
                    child: TextFormField(
                      controller: controllerEmailId,
                      validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.vpn_key_outlined,
                    size: 40.0,
                  ),
                  Container(width: 10,),
                  Expanded(
                    child: TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      validator: (value) {
                        if (value.length < 6) {
                          return 'Please Enter Password ( len > 6 )';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.vpn_key_sharp,
                    size: 40.0,
                  ),
                  Container(width: 10,),
                  Expanded(
                    child: TextFormField(
                      controller: controllerConfirmPassword,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Confirm Password';
                        }
                        if (value != password) {
                          return 'Password Does Not Match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
