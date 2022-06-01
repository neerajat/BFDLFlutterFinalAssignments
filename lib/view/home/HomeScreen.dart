import 'package:flutter/material.dart';
import 'package:flutter_assignment/res/colors/Colors.dart';
import 'package:flutter_assignment/view/widgets/SliverHorizontalList.dart';
import 'package:flutter_assignment/viewmodel/home/HomeVM.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/CustomAppBar.dart';

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
          body: Column(
            children: [

              SizedBox(height: 80, child: SliverHorizontalList()),
              SizedBox(height: 80, child: SliverHorizontalList()),
              SizedBox(height: 80, child: SliverHorizontalList()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorBlack60,
        fixedColor: colorGreen,
        unselectedItemColor: Colors.black,
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'For You',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Rewards',
          ),
        ],
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
