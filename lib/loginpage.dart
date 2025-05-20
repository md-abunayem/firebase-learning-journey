import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/ForgotPasswordPage/forgotpasswordpage.dart';
import 'package:learn_firebase/homepage.dart';
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

  login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UiHelper.CustomALertBox(context, "Enter required fields");
    }
    //else
    try {
      UserCredential usercredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    } on FirebaseAuthException catch (ex) {
      UiHelper.CustomALertBox(context, ex.code.toString());
    }
  }

  /*
  //with .then()
  login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UiHelper.CustomALertBox(context, "Enter required fields");
    }
    //else
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password).then((
          UserCredential usercredential) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      });
    } on FirebaseAuthException catch (ex) {
      UiHelper.CustomALertBox(context, ex.code.toString());
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(
                emailController, "Enter email", false, Icon(Icons.email)),
            SizedBox(
              height: 30,
            ),
            UiHelper.CustomTextField(
                passController, "Enter password", true, Icon(Icons.lock)),
            SizedBox(
              height: 50,
            ),
            UiHelper.CustomButton("Log In", () {
              login(emailController.text.toString(),
                  passController.text.toString());
            }),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    },
                    child: Text("Sign Up")),
                
              ],
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordPage()));
            }, child: Text("Forgot Password",style: TextStyle(fontSize: 20),))
          ],
        ),
      ),
    );
  }
}
