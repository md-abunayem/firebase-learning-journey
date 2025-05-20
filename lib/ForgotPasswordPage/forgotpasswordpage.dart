import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/uiHelper.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  forgotPassword(String email) async {
    if (email.isEmpty) {
      UiHelper.CustomALertBox(context, "Enter an email to reset password");
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      UiHelper.CustomALertBox(context, "Password reset email sent. Check your inbox.");
    } on FirebaseAuthException catch (e) {
      UiHelper.CustomALertBox(context, e.message ?? "Something went wrong");
    } catch (e) {
      UiHelper.CustomALertBox(context, "An unexpected error occurred");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(emailController, "Enter email", false, Icon(Icons.email)),
            SizedBox(height: 15,),
            UiHelper.CustomButton("Reset Password", (){
              forgotPassword(emailController.text.toString());
            })
          ],
        ),
      ),
    );
  }
}
