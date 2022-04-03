import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/auth_provider.dart';
import 'package:wallet_app/views/splash.dart';


void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet App',
      home: Splash(),
    );
  }
}
