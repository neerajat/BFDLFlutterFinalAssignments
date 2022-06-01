
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          )),
          Row(
            children: [
              ElevatedButton(onPressed: (){

              }, child: Text('Get Started'))
            ],
          )
        ],
      ),
    );
  }
}
