import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalInfo extends StatefulWidget {
  @override
  PersonalInfoState createState() => PersonalInfoState();
}

class PersonalInfoState extends State<PersonalInfo> {
  static final formKey = GlobalKey<FormState>();
  static TextEditingController controllerFirstName =
      new TextEditingController();
  static TextEditingController controllerLastName = new TextEditingController();
  static TextEditingController controllerContact = new TextEditingController();

  static String gender = 'Select';
  DateTime displayDate = DateTime(2000);
  static String dob = DateFormat('yyyy-MM-dd').format(DateTime(2000));

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime(DateTime.now().year -15),
    );
    if (picked != null) {
      setState(() {
        displayDate = picked;
        dob = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

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
                  Icons.person_outline_rounded,
                  size: 40.0,
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                    child: TextFormField(
                  controller: controllerFirstName,
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
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )),
                Container(
                  width: 5.0,
                ),
                Expanded(
                    child: TextFormField(
                  controller: controllerLastName,
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
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  size: 40.0,
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controllerContact,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.length < 10) {
                        return 'Please Enter the Correct Contact';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Contact',
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
                  Icons.wc,
                  color: Colors.black,
                  size: 40.0,
                ),
                Container(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Gender : ',
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontStyle: FontStyle.italic,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: gender,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 6,
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                gender = newValue;
                              });
                            },
                            validator: (value) {
                              if (value == null || value == 'Select') {
                                return 'Please Select Your Gender';
                              }
                              return null;
                            },
                            items: <String>['Select', 'Male', 'Female', 'Other']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
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
                  Icons.date_range_sharp,
                  color: Colors.black,
                  size: 40.0,
                ),
                Container(
                  width: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Date Of Birth : ',
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontStyle: FontStyle.italic,
                              fontSize: 17.0,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              "${displayDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () => _selectDate(context),
                          ),
                        ],
                      ),
                      Text(
                        'Age > 15',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
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
