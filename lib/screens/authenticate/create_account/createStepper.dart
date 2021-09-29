import 'package:flutter/material.dart';
import 'package:medical_chatbot/screens/authenticate/create_account/accountCreate.dart';
import 'package:medical_chatbot/screens/authenticate/create_account/medicalInfo.dart';
import 'package:medical_chatbot/screens/authenticate/create_account/personalInfo.dart';
import 'package:medical_chatbot/screens/authenticate/create_account/uploadUserData.dart';
import 'package:medical_chatbot/services/auth.dart';
import 'package:medical_chatbot/shared/loading.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  var currentStep = 0;
  final AuthService _auth = AuthService();
  bool loading = false;
  bool saveData = false;

  @override
  Widget build(BuildContext context) {

    var email = AccountCreateState.controllerEmailId.text;
    var password = AccountCreateState.controllerPassword.text;
    var fName = PersonalInfoState.controllerFirstName.text;
    var lName = PersonalInfoState.controllerLastName.text;
    var contact = PersonalInfoState.controllerContact.text;
    var gender = PersonalInfoState.gender;
    var dob = PersonalInfoState.dob;
    var height = MedicalInfoState.controllerHeight.text;
    var weight = MedicalInfoState.controllerWeight.text;
    var surgical = MedicalInfoState.controllerSurgery.text;
    var medicine = MedicalInfoState.controllerMedications.text;
    var supplement = MedicalInfoState.controllerSupplement.text;
    var allergy = MedicalInfoState.controllerAllergies.text;
    var tobaccoB = MedicalInfoState.tobacco;

    List<Step> steps = [
      Step(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Account ',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.indigo,
                ),
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: Icon(
                    Icons.account_box,
                    size: 30.0,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
        content: AccountCreate(),
        state: currentStep == 0 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Personal ',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.indigo,
                ),
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(
                    Icons.info,
                    size: 30.0,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
        content: PersonalInfo(),
        state: currentStep == 1 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Medical ',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.indigo,
                ),
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(
                    Icons.medical_services,
                    size: 30.0,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
        content: MedicalInfo(),
        state: currentStep == 2 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Save ',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.indigo,
                ),
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(
                    Icons.wifi_protected_setup,
                    size: 30.0,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
        content: UploadUserData(),
        state: StepState.complete,
        isActive: true,
      ),
    ];

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
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
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
                      'Register',
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
            SizedBox(
              child: Theme(
                data: ThemeData(canvasColor: Colors.tealAccent),
                child: Stepper(
                  currentStep: this.currentStep,
                  physics: ClampingScrollPhysics(),
                  steps: steps,
                  type: StepperType.vertical,
                  onStepTapped: (step) {
                    setState(() {
                      currentStep = step;  //commented out for not direct saving data
                    });
                  },
                  onStepContinue: () async{
                    setState(() {
                      if (currentStep < steps.length - 1) {
                        if (currentStep == 0 && AccountCreateState.formKey.currentState.validate()) {
                          currentStep = currentStep + 1;
                        }else if (currentStep == 1 && PersonalInfoState.formKey.currentState.validate()) {
                          currentStep = currentStep + 1;
                        }else if(currentStep == 2 && MedicalInfoState.formKey.currentState.validate()) {
                          currentStep = currentStep + 1;
                        }
                      }else{
                        setState(() {
                          saveData = true;
                        });
                      }
                    });
                    if(saveData){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password, fName, lName, gender, contact, dob, height,
                          weight, surgical, medicine, supplement, allergy, tobaccoB);

                      AccountCreateState.controllerEmailId.clear();
                      AccountCreateState.controllerPassword.clear();
                      AccountCreateState.controllerConfirmPassword.clear();
                      PersonalInfoState.controllerFirstName.clear();
                      PersonalInfoState.controllerLastName.clear();
                      PersonalInfoState.controllerContact.clear();
                      MedicalInfoState.controllerHeight.clear();
                      MedicalInfoState.controllerWeight.clear();
                      MedicalInfoState.controllerSurgery.clear();
                      MedicalInfoState.controllerMedications.clear();
                      MedicalInfoState.controllerSupplement.clear();
                      MedicalInfoState.controllerAllergies.clear();
                      PersonalInfoState.gender = MedicalInfoState.tobacco = MedicalInfoState.surgical = 'Select';
                      MedicalInfoState.medicine = MedicalInfoState.allergy = MedicalInfoState.supplement = 'Select';

                      if (result == null){
                        setState(() {
                          loading = false;
                        });
                      } else{
                        Navigator.pop(context);
                      }
                    }
                  },
                  onStepCancel: () {
                    setState(() {
                      if (currentStep > 0) {
                        currentStep = currentStep - 1;
                      } else {
                        currentStep = 0;
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
