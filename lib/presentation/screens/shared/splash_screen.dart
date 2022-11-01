import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_view.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/login_screen.dart';

class SplachScreen extends StatefulWidget {
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
 // ConstantColors colors = ConstantColors();

  @override
  void initState() {
     Timer(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),),
     );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(

            image: AssetImage("assets/images/splash.png"),
          ),
        ),
      ),
    );
  }
}
