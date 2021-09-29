import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
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
      child: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}

// class Loading extends StatefulWidget {
//   @override
//   _LoadingState createState() => _LoadingState();
// }
//
// class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin{
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           stops: [0.65, 1.0],
//           colors: const <Color>[Color(0xff99D9D1), Color(0xffffffff)],
//         ),
//       ),
//       child: Center(
//         child: SpinKitWave(
//           color: Colors.white,
//           size: 60.0,
//           controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
//         ),
//       ),
//     );
//   }
// }
