import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/auth_provider.dart';

class VerifEmail extends StatefulWidget {
  const VerifEmail({Key? key}) : super(key: key);

  @override
  _VerifEmailState createState() => _VerifEmailState();
}

class _VerifEmailState extends State<VerifEmail> {

  bool isLoading = false;
  bool isSent = false;

  Widget resendEmailButton(){
    return  Column(
      children: [
        const Text('Did\'t receive an email ?'),
        FlatButton(
          onPressed: ()async {
            setState(() {
              isLoading = true;
            });
            final auth = Provider.of<AuthProvider>(context);
            await auth.resendEmailVerif();
            setState(() {
              isLoading = false;
              isSent = true;
            });
          },
          child: Text(isLoading ? 'Sending' : 'Resend'),
        ),
      ],
    );
  }

  Widget resendEmailMsg(){
    return  Container(
        child: const Text('Email Sent!',
        style: TextStyle(
          color: Colors.green,
        ),),
    );
  }

  Widget bottomWidget(){
    return isSent ? resendEmailButton() : resendEmailMsg();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height / 1.2,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(10.0),
            child: const Icon(Icons.drag_handle),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.alternate_email,
                  size: 50.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Verify your email',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'We have send your email with a confirmation link\n to your email address.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Divider(
                  height: 40.0,
                  indent: 50.0,
                  endIndent: 50.0,
                ),
                Text(
                  'Please click on that to verify your email\n and continue the registration process.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Divider(
                  height: 40.0,
                  indent: 50.0,
                  endIndent: 50.0,
                ),

              ],
            ),
          ),
        ],
      ),
    ));
  }
}
