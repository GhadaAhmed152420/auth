import 'package:flutter/material.dart';
import 'package:wallet_app/shared/constants.dart';
import 'package:wallet_app/views/home.dart';
import 'package:wallet_app/views/login.dart';
import 'package:wallet_app/views/verif_email.dart';

class AuthProvider with ChangeNotifier {
  void loginWithEmail(
      {required BuildContext context, String? email, String? password}) async {
    if (email == "ghada@gmail.com" && password == '41463256') {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      print("error");
    }
  }

  void resetPassword({required BuildContext context, String? email}) async {
    if (email!.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      showToast('Email sent please check your email to reset password.');
      Navigator.pop(context);
    } else {
      print("error");
    }
  }

  void registerWithEmail({required BuildContext context, String? name, String? email, String? password}) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context, builder: (context) {
      return const VerifEmail();
    });
  }

  Future<void> resendEmailVerif()async{
    await Future.delayed(const Duration(seconds: 2));
  }
}