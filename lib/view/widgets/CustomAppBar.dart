import 'dart:io';

import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/models/home/Carousal.dart';
import 'package:flutter_assignment/res/colors/Colors.dart';
import 'package:flutter_assignment/utils/utility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/home/HomePage.dart';
import '../../utils/SharedPreferencesConst.dart';
import '../welcome/WelcomeScreen.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {

   CustomAppBar({
    Key? key,required this.imageList,required this.widgetTabList
  }) : super(key: key);

   final List<ImageList> imageList;
   final List<WidgetComponentDetails> widgetTabList;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _CustomAppBarState extends State<CustomAppBar> {
   BottomDrawerController bottomDrawerController = BottomDrawerController();

   var imagePicker;
   var _image;

   @override
  void initState() {

     imagePicker = ImagePicker();

     super.initState();
  }

   @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SliverAppBar(
      backgroundColor: colorGreen,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      // status bar brightness
      expandedHeight: 400.0,
      floating: false,
      pinned: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: () async {
              XFile image = await imagePicker.pickImage(
                  source: ImageSource.gallery, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
              setState(() {
                _image = File(image.path);
              });
            },
            color: colorWhite,
            textColor: Colors.white,
            child: _image!=null?Image.file(
              _image,
              width: 18,
              height: 18,
              fit: BoxFit.fitHeight,
            )
                : Icon(FontAwesomeIcons.user, color: colorGreen, size: 18.0),
            shape: CircleBorder(),
          ),
          SizedBox(
            width: 20,
          ),
          Card(
            color: colorWhite,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Bajaj Markets",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Hello Neeraj")
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          MaterialButton(
            onPressed: () {
              googleSignOut();
              facebookSignOut();
              saveBool(loggedInKey,false).then((value) => {

                Navigator.popAndPushNamed(context, WelcomeScreen.id)

              });

            },
            color: colorWhite,
            textColor: Colors.white,
            child: Icon(Icons.logout, color: colorGreen, size: 18.0),
            shape: CircleBorder(),
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              color: colorWhite,
              height: 400 + statusBarHeight,
            ),
            Card(
              color: colorGreen,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              child: Container(
                height: 250,
              ),
            ),
            Center(
              child: Card(
                margin:
                    EdgeInsets.only(top: 50, bottom: 25, left: 35, right: 35),
                color: colorWhite,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  child: PageView.builder(
                    itemBuilder: (context, position) {
                        return Stack(
                          children: [
                            CachedNetworkImage(
                              height: double.maxFinite, //// USE THIS FOR THE MATCH WIDTH AND HEIGHT
                              width: double.maxFinite,
                              fit: BoxFit.fill,
                              imageUrl: (widget.imageList[position].image)!,
                            ),
                            Align(
                              child: Card(
                                color: colorWhite,
                                margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding:EdgeInsets.all(2),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    child:Column(
                                      children: [
                                        Text(widget.imageList[position].smallText1!,style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                        ),),
                                        Text(widget.imageList[position].smallText2!,style: GoogleFonts.lato(
                                            fontSize: 8,
                                            fontWeight: FontWeight.normal
                                        ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        );
                    },
                    controller: controller,
                    itemCount:widget.imageList.length,
                    ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child: Container(
                  width: 100.0,
                  height: 20.0,
                  margin: EdgeInsets.only(bottom: 50),
                  child: Center(
                    child: SmoothPageIndicator(
                      count: widget.imageList.length,
                      axisDirection: Axis.horizontal,
                      effect: const ExpandingDotsEffect(
                          spacing: 4.0,
                          dotWidth: 4.0,
                          dotHeight: 4.0,
                          dotColor: colorGreen,
                          activeDotColor: colorGreen),
                      controller: controller,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottom: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        tabs:[
          Tab(text: "Finance",),
          Tab(text: "eCart",)
        ],
      ),
    );
  }

  List<Tab> getTabs(List<WidgetComponentDetails> widgetTabList){
     var tabList=<Tab>[];
      widgetTabList.forEach((element) {
       tabList.add(Tab(text: element.name,));
     });
      return tabList;
  }

  @override
  Size get preferredSize => const Size.fromHeight(300);
}
