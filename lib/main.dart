import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/welcome_screen.dart';

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
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}
