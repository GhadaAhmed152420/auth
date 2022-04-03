import 'package:flutter/material.dart';
import 'package:wallet_app/shared/constants.dart';

Widget authTitle({required String title, required String subtitle}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 3.0,
        ),
        Text(
          subtitle,
        ),
      ],
    ),
  );
}

Widget inputSubmit({required String title, required Function onPressed}) {
  return Container(
    width: double.infinity,
    child: RaisedButton(
      color: Colors.purple,
      textColor: Colors.white,
      shape: const StadiumBorder(),
      child: Text(title),
      onPressed: () {
        onPressed;
      },
    ),
  );
}

Widget inputEmail({required TextEditingController controller}) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: controller,
    decoration: const InputDecoration(
      hintText: 'Email',
      helperText: 'Enter email',
    ),
    validator: (val) => validator(
      isRequired: true,
      value: val,
      isEmail: true,
    ),
  );
}