import 'package:flutter/material.dart';
import 'package:learn_firebase/signuppage.dart';
import 'package:learn_firebase/uiHelper.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(emailController, "Enter email", false, Icon(Icons.email)),
            SizedBox(height: 30,),
            UiHelper.CustomTextField(passController, "Enter password", true, Icon(Icons.lock)),
            SizedBox(height: 50,),
            UiHelper.CustomButton("Log In",(){

            }),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SignUpPage();
                  }));
                }, child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
