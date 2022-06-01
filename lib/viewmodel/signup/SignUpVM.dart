import 'package:flutter/material.dart';
import 'package:flutter_assignment/repository/signup/SignUpRepoImp.dart';
import 'package:flutter_assignment/viewmodel/BaseVM.dart';

class SignUpVM extends BaseVM{

  final _signUpRepo = SignUpRepoImp();

  String? _token;
  get token => _token;
  set token(value) {
    _token = value;
  }

  Future registerUser(String email,String password) async {

    var jsonData=await _signUpRepo.registerUser(email, password);
    _token=jsonData.token;
    notifyListeners();
  }
}