import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future navigateTo(BuildContext context, Widget widget){
  return Navigator.push(context,
      MaterialPageRoute(builder: (context)=> widget));
}

Future showToast(String msg){
  return Fluttertoast.showToast(msg: msg,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG);
}

String? validator({required String? value, bool isRequired = false, bool isEmail = false, int? minLength, String? match}){
  
  if (isRequired && value!.isEmpty) {
    return'Required';
  }
  if(isEmail){
    if(value!.contains('@') || value.contains('.')){
      return 'Invalid Email!';
    }
  }
  if(minLength != null){
    if(value!.length < minLength){
      return 'Min $minLength character';
    }
  }

  if(match != null){
    if(value != match){
      return'No Match!';
    }
  }

  return null;
}