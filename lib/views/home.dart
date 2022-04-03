import 'package:flutter/material.dart';
import 'package:wallet_app/view_models/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create instance from home view model
  var data = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Icon(
          Icons.add,
          size: 32.0,
        ),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${data.getCounter()}'),
            TextButton(onPressed: () {
              //I will send action to view model
              setState(() {
                data.inc();
              });
            }, child: const Icon(Icons.add)),
          ],
         ),
      ),
    );
  }
}

