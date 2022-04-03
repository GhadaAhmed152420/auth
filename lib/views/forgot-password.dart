import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/auth_provider.dart';
import 'package:wallet_app/shared/components.dart';
import 'package:wallet_app/shared/constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  bool isLoading = false;
  TextEditingController email = TextEditingController();
  GlobalKey <FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.purple,)
          : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                authTitle(title: "Forgot Password",
                    subtitle: "Enter your email we\'ll send you a link to reset your password"),
                inputEmail(controller: email),
                const SizedBox(
                  height: 30.0,
                ),
                inputSubmit(title: 'send', onPressed: () {
                  if (formKey.currentState!.validate()) return;
                  final auth = Provider.of<AuthProvider>(
                      context, listen: false);
                  setState(() {
                    isLoading = true;
                  });
                  auth.resetPassword(
                    context: context,
                    email: email.text,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
