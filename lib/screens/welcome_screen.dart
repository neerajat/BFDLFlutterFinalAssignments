import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/flowers.dart';
import 'package:flutter_assignment/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../const/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  static const List<Flower> flowers = <Flower>[
    Flower(
        flower_name: "Strelitzia",
        flower_link: "https://www.linkpicture.com/q/strelitzia.png"),
    Flower(
        flower_name: "Netted Iris",
        flower_link: "https://www.linkpicture.com/q/nettediris.png"),
    Flower(
        flower_name: "Helianthas",
        flower_link: "https://www.linkpicture.com/q/helianthas.png"),
  ];
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SafeArea(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 16.0, top: 24.0, bottom: 10.0, right: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: colorSkyBlue,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 150.0,
                          height: 40.0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35),
                              ),
                              color: colorOrange,
                            ),
                            child: Text(
                              flowers[_position].flower_name,
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        child: PageView.builder(
                          controller: controller,
                          itemCount: flowers.length,
                          onPageChanged: _onPageViewChange,
                          itemBuilder: (context, position) {
                            return Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(bottom: 10),
                              child: CachedNetworkImage(
                                height: 550,
                                width: 230,
                                fit: BoxFit.fill,
                                imageUrl: flowers[position].flower_link,
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CachedNetworkImage(
                          imageUrl: "https://www.linkpicture.com/q/care_1.png",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 100.0,
                    height: 20.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: colorPink,
                      ),
                      child: Center(
                        child: SmoothPageIndicator(
                          count: 3,
                          axisDirection: Axis.horizontal,
                          effect: const ExpandingDotsEffect(
                              spacing: 8.0,
                              dotWidth: 8.0,
                              dotHeight: 8.0,
                              dotColor: colorOrange,
                              activeDotColor: colorOrange),
                          controller: controller,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: colorPink,
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, right: 24.0, left: 24.0),
                      //specify the button's Padding
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              35.0)), // set the buttons shape. Make its birders rounded etc
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text("Get Started",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: colorOrange,
                            fontWeight: FontWeight.w700,
                          )),
                    )),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0)),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text("Login",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: colorOrange,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    _position = page;
    setState(() {});
  }
}
