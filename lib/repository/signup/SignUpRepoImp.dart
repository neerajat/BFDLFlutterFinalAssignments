import 'package:flutter_assignment/repository/signup/SignUpRepo.dart';

import '../../data/remote/network/ApiEndPoints.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';
import '../../models/login/LoginRequest.dart';
import '../../models/login/LoginResponse.dart';

class SignUpRepoImp extends SignUpRepo{
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future registerUser(String email, String password) async {
    try {
      dynamic response = await _apiService.postResponse(
          ApiEndPoints().signUpEndPoint,LoginRequest(email: email,password: password).toJson(),false);
      print("$response");
      return LoginResponse.fromJson(response);
    } catch (e) {
      print("$e}");
      rethrow;
    }
  }

}