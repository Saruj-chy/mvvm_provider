import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static void fieldFocusNode(BuildContext context, FocusNode current, FocusNode nextFocus){
    FocusScope.of(context).requestFocus(nextFocus);

  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: Colors.black,
        textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT
    );
  }


  static void flushBarErrorMessage(String msg, BuildContext context){
    showFlushbar(context: context,
        flushbar: Flushbar(
          message: msg,
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          duration: Duration(seconds: 3),
          borderRadius: BorderRadius.circular(20),
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(Icons.error, size: 20, color: Colors.white,),
        )..show(context));
  }


  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.red,
          content: Text(message))
    );
  }
}
