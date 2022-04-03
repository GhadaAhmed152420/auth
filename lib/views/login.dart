import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/auth_provider.dart';
import 'package:wallet_app/shared/components.dart';
import 'package:wallet_app/shared/constants.dart';
import 'package:wallet_app/views/forgot-password.dart';
import 'package:wallet_app/views/register.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obSecureText = true;
  bool isLoading = false;
  GlobalKey <FormState> formKey = GlobalKey<FormState>();


  Widget inputPassword() {
    return Stack(
      children: [
        TextFormField(
          controller: password,
          obscureText: obSecureText,
          decoration: const InputDecoration(
            hintText: 'Password',
          ),
          validator: (val) => validator(
            isRequired: true,
            value: val,
            minLength: 8,
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    obSecureText = ! obSecureText;
                  });
                }, icon: obSecureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),color: Colors.grey[600],))
      ],
    );
  }

  Widget forgotPassword() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0),
          child: const Text(
            'ForgotPassword ?',
          ),
        ),
      ),
      onTap: () {
        navigateTo(context, const ForgotPassword());
      },
    );
  }

  Widget textDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: const [
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'OR CONNECT WITH',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget googleSignIn() {
    return Container(
      width: double.infinity,
      child: RaisedButton.icon(
        shape: const StadiumBorder(),
        label: const Text('Google'),
        icon: const Icon(MdiIcons.google,size: 20.0,),
        onPressed: () {},
      ),
    );
  }

  Widget textRegister() {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account?',
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Register()));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: isLoading ? const CircularProgressIndicator(color: Colors.purple,) : Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            child: Column(
              key: formKey,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                authTitle(subtitle: 'Enter your email & password', title: 'Login'),
                inputEmail(controller: email),
                inputPassword(),
                forgotPassword(),
                inputSubmit(
                    onPressed:(){
                      if(formKey.currentState!.validate()) return ;
                      final auth = Provider.of<AuthProvider>(context);
                      setState(() {
                        isLoading = true;
                      });
                      auth.loginWithEmail(
                        context: context,
                        email: email.text,
                        password: password.text,
                      );
                    },
                    title: 'Login' ),
                textDivider(),
                googleSignIn(),
                textRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
