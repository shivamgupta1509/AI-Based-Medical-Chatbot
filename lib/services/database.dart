import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference medbotCollection =  FirebaseFirestore.instance.collection('MediBot');

  Future updateUserData(String email, String fName,
      String lName, String gender, String contact, String dob, String height,
      String weight, String surgical, String medicine, String supplement,
      String allergy, String tobaccoB) async {
    return await medbotCollection.doc(uid).set({
      'Email' : email,
      'FirstName' : fName,
      'LastName' : lName,
      'Gender' : gender,
      'Contact' : contact,
      'Date of birth' : dob,
      'Height in cm' : height,
      'Weight in kg' : weight,
      'Surgical History' : surgical,
      'Medication History' : medicine,
      'Supplement History' : supplement,
      'Any Allergy' : allergy,
      'Tobacco consumption' : tobaccoB,
    });
  }

  //Get collection stream
  // Stream<QuerySnapshot> get botUsers{
  //   return medbotCollection.snapshots();
  // }
}