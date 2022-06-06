import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/res/colors/Colors.dart';
import 'package:flutter_assignment/viewmodel/home/HomeVM.dart';
import 'package:provider/provider.dart';

import '../../models/home/Ecart.dart';
import '../../models/home/HomePage.dart';
import '../../utils/const/Constant.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/SliverHorizontalListWidgetOne.dart';
import '../widgets/SliverHorizontalListWidgetTwo.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    var provider = Provider.of<HomeVM>(context, listen: false);
    provider.loadHomeCarousalContent();
    provider.loadDockList();
    provider.loadSliverContent();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<HomeVM>(context);

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              CustomAppBar(
                imageList: vm.imageList,
                widgetTabList: vm.tabList,
              ),
            ];
          },
          body: ListView(
            children: customSliverListBody(vm.personalizationSequence),
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(vm.dockList),
    );
  }

  Widget customBottomNavigationBar(List<WidgetComponentDetails> dockList) {
    List<BottomNavigationBarItem> bottomNavItem = <BottomNavigationBarItem>[];
    for (var element in dockList) {
      bottomNavItem.add(BottomNavigationBarItem(
          icon: SizedBox(
            height: 28,
            child: CachedNetworkImage(
              imageUrl: "$imageBaseUrl" + element.imageIcon.toString(),
            ),
          ),
          label: element.name));
    }
    return bottomNavItem.isNotEmpty?BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorBlack60,
      fixedColor: colorGreen,
      unselectedItemColor: Colors.black,
      onTap: onItemTapped,
      currentIndex: selectedIndex,
      items: bottomNavItem,
    ):Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  List<Widget> customSliverListBody(List<PersonalizationSequence> list){
    List<Widget> dynamicWidget=<Widget>[];
    List<PersonalizationSequence> personalizationSequence=<PersonalizationSequence>[];
    personalizationSequence=list;
    for (var element in personalizationSequence) {
      if(dynamicWidget.length%2==0){
        dynamicWidget.add(
            SizedBox(height: 100, child: SliverHorizontalListWidgetOne(widgetTabList: element.widgetComponentDetails!,)
            ));
      }
      else{
        dynamicWidget.add(
            SizedBox(height: 100, child: SliverHorizontalListWidgetTwo(widgetTabList: element.widgetComponentDetails!,)
            ));
      }
    }
    print(dynamicWidget.length);

    return dynamicWidget.isNotEmpty?dynamicWidget:[Container()];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
