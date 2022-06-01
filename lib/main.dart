import 'package:flutter/material.dart';
import 'package:flutter_assignment/res/colors/Colors.dart';
import 'package:flutter_assignment/utils/SharedPreferencesConst.dart';
import 'package:flutter_assignment/view/home/HomeScreen.dart';
import 'package:flutter_assignment/view/login/LoginScreen.dart';
import 'package:flutter_assignment/view/signup/SignUpScreen.dart';
import 'package:flutter_assignment/view/welcome/WelcomeScreen.dart';
import 'package:flutter_assignment/viewmodel/home/HomeVM.dart';
import 'package:flutter_assignment/viewmodel/login/LoginVM.dart';
import 'package:flutter_assignment/viewmodel/signup/SignUpVM.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const FlutterAssignment());
}

class FlutterAssignment extends StatefulWidget {
  const FlutterAssignment({Key? key}) : super(key: key);

  @override
  State<FlutterAssignment> createState() => _FlutterAssignmentState();
}

class _FlutterAssignmentState extends State<FlutterAssignment> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeVM(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginVM(),
        ),
        ChangeNotifierProvider(
            create: (context) => SignUpVM()
        ),
      ],
      child:  MaterialApp(
        //initialRoute: WelcomeScreen.id,
        initialRoute: (true==getBool(loggedInKey))?HomeScreen.id:WelcomeScreen.id,
        routes: {
          HomeScreen.id : (context) => HomeScreen(),
          WelcomeScreen.id : (context) => WelcomeScreen(),
          LoginScreen.id : (context) => LoginScreen(),
          SignUpScreen.id : (context) => SignUpScreen(),
        },
      ),

    );
  }

  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
