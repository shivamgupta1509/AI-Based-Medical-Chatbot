import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                // Vertical Line
                Container(
                  margin: EdgeInsets.fromLTRB(2, 3, 10, 0),
                  width: 3,
                  height: 150,
                  decoration: ShapeDecoration(
                      color: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 75),
                    child: Text(
                      'Disclaimer',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Orbitron',
                        color: Colors.indigo,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w900,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 10.0),
                  child: Text(
                    "Please Read Carefully!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Zendots",
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(children: [
                Flexible(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                    decoration: BoxDecoration(color: Colors.indigo),
                    child: Text(
                      "The MediBot is an AI based Medical ChatBot "
                      "Which can provide you with the information regarding "
                      "on health condition and suitable home remedies for it.\n\n"
                      "This is designed for home remedy diseases only, if "
                      "you have been facing issues for a long time or seem severe"
                      "in any way then it is best to consult a doctor immediately.\n\n"
                      "The remedies may not always work for you in such case, "
                      "a doctor's expertise is best advised.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        // fontFamily: "Zendots",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      label: Text('Back'),
                      icon: Icon(Icons.arrow_back),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_forward),
                      label: Text('Continue'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                color:Colors.orangeAccent,
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
