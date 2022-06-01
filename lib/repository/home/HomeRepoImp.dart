import 'package:flutter_assignment/models/home/Carousal.dart';
import 'package:flutter_assignment/models/home/Ecart.dart';
import 'package:flutter_assignment/models/home/HomePage.dart';
import 'package:flutter_assignment/repository/home/HomeRepo.dart';

import '../../data/remote/network/ApiEndPoints.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';

class HomeRepoImp extends HomeRepo {

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<List<ImageList>> loadHomeCarousalContent() async {
    try {
      dynamic response = await _apiService.getResponse(
          ApiEndPoints().homeCarousalEndPoint,true);
      final jsonData = Carousal.fromJson(response);
      print(jsonData.list);
      return jsonData.list!;
    } catch (e) {
      print("$e}");
      rethrow;
    }
  }

  @override
  Future<HomePage> loadHomeContent() async{
    try {
      dynamic response = await _apiService.getResponse(
          ApiEndPoints().homeContentEndPoint,true);
      final jsonData = HomePage.fromJson(response);
      print(jsonData);
      return jsonData;
    } catch (e) {
      print("$e}");
      rethrow;
    }
  }

  @override
  Future<Ecart> loadSliverBodyContent() async{
    try {
      dynamic response = await _apiService.getResponse(
          ApiEndPoints().homeSliverBodyEndPoint,true);
      final jsonData = Ecart.fromJson(response);
      print(jsonData);
      return jsonData;
    } catch (e) {
      print("$e}");
      rethrow;
    }
  }

}