import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/res/colors/colors.dart';
import 'package:flutter_assignment/view/signup/SignUpScreen.dart';
import 'package:flutter_assignment/viewmodel/login/LoginVM.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/strings/strings.dart';
import '../../utils/SharedPreferencesConst.dart';
import '../../utils/mixin/InputValidationMixin.dart';
import '../home/HomeScreen.dart';
import '../widgets/SocialLoginWidget.dart';

class LoginScreen extends StatefulWidget with InputValidationMixin {
  static const String id = "login_screen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  bool _isHidden = true;
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final prefs = SharedPreferences.getInstance();
  var isLoading=false;

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    LoginVM loginVM = context.watch<LoginVM>();


    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
                constraints: const BoxConstraints.expand(),
                child: Image.asset(
                  'images/login_background.png',
                  fit: BoxFit.cover,
                )),
            Container(
              color: colorBlack60,
              constraints: const BoxConstraints.expand(),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: width,
                        child: Text(
                          hintSignIn,
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
                        controller: emailTextEditingController
                          ..text = 'eve.holt@reqres.in',
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
                        validator: (email) {
                          if (widget.isEmailValid(email!)) {
                            return null;
                          } else {
                            return errorTxtEmailId;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          controller: passwordTextEditingController
                            ..text = 'cityslicka',
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
                          validator: (password) {
                            if (widget.isPasswordValid(password!)) {
                              return null;
                            } else {
                              return errorTxtPassword;
                            }
                          }),
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
                          onPressed: () async {
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();
                              setState(() {
                                isLoading=true;
                              });
                             await loginVM.loginUser(emailTextEditingController.text
                                  .toString(),
                                  passwordTextEditingController.text
                                      .toString());

                              if(loginVM.token.isNotEmpty){
                                print("token => ${loginVM.token}");
                                await  loginVM.saveBool(loggedInKey, true);
                                setState(() {
                                  isLoading=false;
                                });
                                Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id,(Route<dynamic> route) => false);

                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: colorPink60,
                            maximumSize: Size(width * 0.8, 48),
                            padding: const EdgeInsets.only(
                                top: 2.0,
                                bottom: 2.0,
                                right: 24.0,
                                left: 24.0),
                            //specify the button's Padding
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    35.0)), // set the buttons shape. Make its birders rounded etc
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            alignment: Alignment.center,
                            child: Text(hintSignIn,
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
                      const SocialLoginWidget(),
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
                            text: " $txtSignUp",
                            style: GoogleFonts.lato(
                              textStyle:
                              const TextStyle(color: colorPink60),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, SignUpScreen.id);
                              },
                          ),
                        ])),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if(isLoading)
              Container(
                  constraints: const BoxConstraints.expand(),
                  child: Center(child: CircularProgressIndicator())),
          ],
        ));
  }
}

