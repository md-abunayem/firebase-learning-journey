import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/loginpage.dart';
import 'package:learn_firebase/uiHelper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logOut(BuildContext context) {
    FirebaseAuth.instance.signOut().then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInPage()),
      );
    }).catchError((error) {
      UiHelper.CustomALertBox(context, "Logout failed: ${error.toString()}");
    });
  }


  //showing logout dialog boc
  void confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Logout"),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Cancel
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              logOut(context);        // Proceed logout
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //fetch user email
    final userEmail = FirebaseAuth.instance.currentUser?.email ?? "User";

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () => confirmLogout(context),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Welcome, $userEmail",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
