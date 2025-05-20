import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/homepage.dart';
import 'package:learn_firebase/loginpage.dart';
import 'package:learn_firebase/uiHelper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  signup(String email, String password) async {
    if (email == "" || password == "") {
      UiHelper.CustomALertBox(context, "Enter required fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password).then((value){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));});
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.CustomALertBox(context, ex.code.toString());
      }
    }
  }


  //OR
/*
  signup(String email, String password) async {
  if (email.isEmpty || password.isEmpty) {
    UiHelper.CustomALertBox(context, "Enter required fields");
    return;
  }
  //else
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  } on FirebaseAuthException catch (ex) {
    UiHelper.CustomALertBox(context, ex.message ?? "An error occurred");
  }
}
*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(
                emailController, "Enter email", false, Icon(Icons.email)),
            SizedBox(height: 30,),
            UiHelper.CustomTextField(
                passController, "Enter password", true, Icon(Icons.lock)),
            SizedBox(
              height: 50,
            ),
            UiHelper.CustomButton("Sign Up", () {
              signup(emailController.text.toString(), passController.text.toString());
            },),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already  have an account?"),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage(),));
                  }, child: Text("Log In"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
