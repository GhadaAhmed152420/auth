import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/auth_provider.dart';
import 'package:wallet_app/shared/components.dart';
import 'package:wallet_app/shared/constants.dart';
import 'package:wallet_app/views/verif_email.dart';

import 'login.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isLoading = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConf = TextEditingController();
  GlobalKey <FormState> formKey = GlobalKey<FormState>();



  Widget inputName() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: name,
      decoration: const InputDecoration(
        hintText: 'Name',
        helperText: 'Enter full name',
      ),
      validator: (val) => validator(
        isRequired: true,
        value: val,
        minLength: 3,
      ),
    );
  }

  Widget inputPassword() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: password,
            decoration: const InputDecoration(
              hintText: '******',
              helperText: 'Enter Password',
            ),
            validator: (val) => validator(
              isRequired: true,
              value: val,
              minLength: 8,
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: passwordConf,
            decoration: const InputDecoration(
              hintText: '******',
              helperText: 'Confirm Password',
            ),
            validator: (val) => validator(
              isRequired: true,
              value: val,
              minLength: 8,
              match: password.text
            ),
          ),
        ),
      ],
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

  Widget googleSignUp() {
    return Container(
      width: double.infinity,
      child: RaisedButton.icon(
        shape: const StadiumBorder(),
        label: const Text('Google'),
        icon: const Icon(MdiIcons.google, size: 20.0,),
        onPressed: () {},
      ),
    );
  }

  Widget textLogin() {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account?',
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Login()));
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
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.purple,)
          : Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  authTitle(subtitle: 'Let\'s Get Started', title: 'Register'),
                  inputName(),
                  inputEmail(controller: email),
                  inputPassword(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  inputSubmit(
                      onPressed: () {
                        if(formKey.currentState!.validate()) return ;
                        final auth = Provider.of<AuthProvider>(context,listen: false);
                        setState(() {
                          isLoading = true;
                        });
                        auth.registerWithEmail(
                          context: context,
                          name: name.text,
                          email: email.text,
                          password: password.text,
                        );
                      },
                      title: 'Register'),
                  textDivider(),
                  googleSignUp(),
                  textLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
