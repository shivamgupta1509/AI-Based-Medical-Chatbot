import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_chatbot/models/user.dart';
import 'package:medical_chatbot/services/database.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create custom user obj based on FireBaseUser
  CustomUser _userFromFirebaseUser(User user){
    return user != null ? CustomUser(uid: user.uid, email: user.email) : null;
  }

  // auth change user stream
  Stream<CustomUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

// register with email and password
  Future registerWithEmailAndPassword(String email, String password, String fName,
      String lName, String gender, String contact, String dob, String height,
      String weight, String surgical, String medicine, String supplement,
      String allergy, String tobaccoB) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(
          email, fName, lName, gender, contact, dob, height,
          weight, surgical, medicine, supplement, allergy, tobaccoB);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

// sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }

  }

}