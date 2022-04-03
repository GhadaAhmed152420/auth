import 'package:flutter/material.dart';
import 'package:wallet_app/views/home.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkUser(true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Icon(
          Icons.account_balance_wallet,
          size: 128.0,
          color: Colors.white,
        ),
      ),
    );
  }

  void checkUser(bool user)async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> user ? const Home() : const Login()));
  }
}
