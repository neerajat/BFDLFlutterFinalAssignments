

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/utility.dart';
import '../home/HomeScreen.dart';

class SocialLoginWidget extends StatefulWidget {



  const SocialLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SocialLoginWidget> createState() => _SocialLoginWidgetState();
}

class _SocialLoginWidgetState extends State<SocialLoginWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
          //  Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id,(Route<dynamic> route) => false);
           facebookSignInProcess(context);
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Icon(FontAwesomeIcons.facebookF,
              color: Colors.white, size: 18.0),
          shape: CircleBorder(),
        ),
        MaterialButton(
          onPressed: () {
            //Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id,(Route<dynamic> route) => false);
            googleSignInProcess(context);
          },
          color: Colors.deepOrange,
          textColor: Colors.white,
          child: Icon(FontAwesomeIcons.googlePlusG,
              color: Colors.white, size: 18.0),
          shape: CircleBorder(),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id,(Route<dynamic> route) => false);

          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Icon(FontAwesomeIcons.twitter,
              color: Colors.white, size: 18.0),
          shape: CircleBorder(),
        ),
      ],
    );
  }

}
