import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/homepage.dart';
import 'package:learn_firebase/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // final user = FirebaseAuth.instance.currentUser;
    User? user = FirebaseAuth.instance.currentUser;

    super.initState();
    Timer(Duration(seconds: 2),(){
      if(user != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return HomePage();}));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return LogInPage();}));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Firebase Learning",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 40),),
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
