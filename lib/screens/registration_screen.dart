
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/const/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/strings.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
                constraints: const BoxConstraints.expand(),
                child: Image.asset(
                  'images/sign_up_background.png',
                  fit: BoxFit.cover,
                )),
            Container(
              color: colorBlack60,
              constraints: const BoxConstraints.expand(),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: width,
                      child: Text(
                        hintSignUp,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      cursorColor: colorWhite,
                      style: GoogleFonts.lato(
                        color: colorWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: colorWhite70),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: colorWhite),
                          ),
                          fillColor: colorWhite,
                          focusColor: Colors.white,
                          suffixIcon: const Icon(
                              Icons.lock,
                            color: colorWhite,
                          ),
                          hintText: hintUserName,
                          hintStyle: GoogleFonts.lato(
                            color: colorWhite70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      cursorColor: colorWhite,
                      style: GoogleFonts.lato(
                        color: colorWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: colorWhite70),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: colorWhite),
                          ),
                          fillColor: colorWhite,
                          focusColor: Colors.white,
                          suffixIcon: const Icon(
                            Icons.email,
                            color: colorWhite,
                          ),
                          hintText: hintEmailId,
                          hintStyle: GoogleFonts.lato(
                            color: colorWhite70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      obscureText: _isHidden,
                      cursorColor: colorWhite,
                      style: GoogleFonts.lato(
                        color: colorWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: colorWhite70),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: colorWhite),
                          ),
                          fillColor: colorWhite,
                          focusColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: colorWhite,
                            ),
                            onPressed: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                          ),
                          hintText: hintPassword,
                          hintStyle: GoogleFonts.lato(
                            color: colorWhite70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      width: width,
                      child: Text(
                        forgotPassword,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: colorPink60,
                          maximumSize: Size(width * 0.8, 48),
                          padding: const EdgeInsets.only(
                              top: 2.0, bottom: 2.0, right: 24.0, left: 24.0),
                          //specify the button's Padding
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  35.0)), // set the buttons shape. Make its birders rounded etc
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          alignment: Alignment.center,
                          child: Text(hintSignUp,
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: colorWhite,
                                fontWeight: FontWeight.w700,
                              )),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Text(
                        createdWith,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(color: colorWhite),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Icon(FontAwesomeIcons.facebookF,
                              color: Colors.white, size: 18.0),
                          shape: CircleBorder(),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.deepOrange,
                          textColor: Colors.white,
                          child: Icon(FontAwesomeIcons.googlePlusG,
                              color: Colors.white, size: 18.0),
                          shape: CircleBorder(),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Icon(FontAwesomeIcons.twitter,
                              color: Colors.white, size: 18.0),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: doNotHaveAnAccount,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(color: colorWhite),
                                fontWeight: FontWeight.normal)),
                        TextSpan(
                          text: " $txtSignIn",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(color: colorPink60),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(builder: (context) => RegistrationScreen()),
                              );
                            },
                        ),
                      ])),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
