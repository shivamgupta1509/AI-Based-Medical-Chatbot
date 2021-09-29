import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicalInfo extends StatefulWidget {
  @override
  MedicalInfoState createState() => MedicalInfoState();
}

class MedicalInfoState extends State<MedicalInfo> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController controllerHeight = new TextEditingController();
  static TextEditingController controllerWeight = new TextEditingController();
  static TextEditingController controllerSurgery =
      new TextEditingController();
  static TextEditingController controllerMedications =
      new TextEditingController();
  static TextEditingController controllerSupplement =
      new TextEditingController();
  static TextEditingController controllerAllergies =
      new TextEditingController();
  static String surgical = 'Select';
  static String medicine = 'Select';
  static String supplement = 'Select';
  static String allergy = 'Select';
  static String tobacco = 'Select';


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
                  Icons.accessibility,
                  size: 40.0,
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controllerHeight,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter the Height';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height (in cm)',
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
              height: 10.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.line_weight,
                  size: 40.0,
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controllerWeight,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter the Weight';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight (in kg)',
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
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.medical_services_outlined,
                  size: 40.0,
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                      'Surgical History : ',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                ),
                Container(
                  width: 20.0,
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: surgical,
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
                        surgical = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value == 'Select') {
                        return 'Please Select Proper Option';
                      }
                      return null;
                    },
                    items: <String>['Select','Yes', 'No']
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
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 50,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controllerSurgery,
                    validator: (value) {
                      if (surgical ==  'Yes' && value.isEmpty) {
                        return 'Please Enter the Details';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'If yes, Mention...',
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
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.brightness_high_sharp,
                  size: 40.0,
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Medication History : ',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: 5.0,
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: medicine,
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
                        medicine = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value == 'Select') {
                        return 'Please Select Proper Option';
                      }
                      return null;
                    },
                    items: <String>['Select','Yes', 'No']
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
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 50,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controllerMedications,
                    validator: (value) {
                      if (medicine   ==  'Yes' && value.isEmpty) {
                        return 'Please Enter the Details';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'If yes, Mention...',
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
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.animation,
                  size: 40.0,
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Supplement History : ',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: 5.0,
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: supplement,
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
                        supplement = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value == 'Select') {
                        return 'Please Select Option';
                      }
                      return null;
                    },
                    items: <String>['Select','Yes', 'No']
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
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 50,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controllerSupplement,
                    validator: (value) {
                      if (supplement   ==  'Yes' && value.isEmpty) {
                        return 'Please Enter the Details';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'If yes, Mention...',
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
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.mediation,
                  size: 40.0,
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Any Allergies : ',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: 5.0,
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: allergy,
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
                        allergy = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value == 'Select') {
                        return 'Please Select Proper Option';
                      }
                      return null;
                    },
                    items: <String>['Select','Yes', 'No']
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
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 50,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controllerAllergies,
                    validator: (value) {
                      if (allergy   ==  'Yes' && value.isEmpty) {
                        return 'Please Enter the Details';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'If yes, Mention...',
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
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.ac_unit,
                  size: 40.0,
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Tobacco History : ',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: 5.0,
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: tobacco,
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
                        tobacco = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value == 'Select') {
                        return 'Please Select Option';
                      }
                      return null;
                    },
                    items: <String>['Select','Yes', 'No']
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

          ],
        ),
        ),
    );
  }
}
