import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spin extends StatelessWidget {
  const Spin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      size: 85.0,
      color: Colors.greenAccent,
      duration: Duration(seconds: 2),
      //controller: AnimationController(vsync:this ),
    );
  }
}
///this is the spinner that is seen as the app fetches data 
///from the api as the userwaits 
///