import 'package:flutter/material.dart';

class UiHelper{
  static Widget CustomTextField(TextEditingController controller, String text, bool toHide, Icon icon){
    return Container(
      height: 50,
      width: 350,

      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple,width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple,width: 1),
            borderRadius: BorderRadius.circular(10),
          ),


        ),
      ),
    );

  }
  static Widget CustomButton(String text, VoidCallback callback){
    return Container(
      height: 50,
      width: 300,
      child: ElevatedButton(onPressed: callback, child: Text(text),style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white
      ),),
    );
  }



  static CustomALertBox(BuildContext context, String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("OK"))
        ],
      );
    });
  }

}