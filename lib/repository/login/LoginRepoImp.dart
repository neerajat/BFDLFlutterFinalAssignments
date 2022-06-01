import 'package:flutter_assignment/models/login/LoginRequest.dart';
import 'package:flutter_assignment/models/login/LoginResponse.dart';
import 'package:flutter_assignment/repository/login/LoginRepo.dart';

import '../../data/remote/network/ApiEndPoints.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';

class LoginRepoImp extends LoginRepo {

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<LoginResponse> loginUser(String email, String password) async {
    try {
      dynamic response = await _apiService.postResponse(
          ApiEndPoints().loginEndPoint,LoginRequest(email: email,password: password).toJson(),false);
      print("$response");
      return LoginResponse.fromJson(response);
    } catch (e) {
      print("$e}");
      rethrow;
    }

  }



}