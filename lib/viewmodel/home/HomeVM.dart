import 'package:flutter/cupertino.dart';
import 'package:flutter_assignment/models/home/Carousal.dart';
import 'package:flutter_assignment/models/home/HomePage.dart';
import 'package:flutter_assignment/repository/home/HomeRepoImp.dart';

import '../../models/home/Ecart.dart';

class HomeVM extends ChangeNotifier{

  final _homeRepo = HomeRepoImp();

  List<ImageList>? _imageList;
  get imageList => _imageList;
  set imageList(value) {
    _imageList = value;
  }

  Future loadHomeCarousalContent() async {
    _imageList=<ImageList>[];
       try{
         _imageList= await _homeRepo.loadHomeCarousalContent();
       }catch(e){
         print(e);
       }
       notifyListeners();
  }


  List<WidgetComponentDetails>? _dockList;
  get dockList => _dockList;
  set dockList(value) {
    _dockList = value;
  }

List<WidgetComponentDetails>? _tabList;
  get tabList => _tabList;
  set tabList(value) {
    _tabList = value;
  }


  Future loadDockList() async {
    _dockList=<WidgetComponentDetails>[];
    _tabList=<WidgetComponentDetails>[];
    try{
      dynamic response= (await _homeRepo.loadHomeContent());

      ///dockList
      final dockData=response.dock;
      print(dockData);
      final wigetList=dockData?.widgetComponentDetails;
      print(wigetList);
      _dockList=wigetList;

      ///tabList
      final tabData=response.homeTabView;
      print(tabData);
      final tabList=tabData?.widgetComponentDetails;
      print(tabList);
      _tabList=tabList;

    }catch(e){
      print(e);
    }
    notifyListeners();
  }




  List<PersonalizationSequence>? _personalizationSequence;
  get personalizationSequence => _personalizationSequence;
  set personalizationSequence(value) {
    _personalizationSequence = value;
  }

  Future loadSliverContent() async {
    _personalizationSequence=<PersonalizationSequence>[];
    try{
      dynamic response= await _homeRepo.loadSliverBodyContent();
      _personalizationSequence=response.payload.personalizationSequence ;
      print(_personalizationSequence);
    }catch(e){
      print(e);
    }
    notifyListeners();
  }


}