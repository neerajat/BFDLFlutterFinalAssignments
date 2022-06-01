
import 'package:flutter_assignment/repository/login/LoginRepoImp.dart';
import 'package:flutter_assignment/viewmodel/BaseVM.dart';

class LoginVM extends BaseVM {

  final _loginRepo = LoginRepoImp();

  String? _token;
  get token => _token;
  set token(value) {
    _token = value;
  }

  Future loginUser(String email,String password) async {
   var jsonData=  await _loginRepo.loginUser(email, password);
   _token=jsonData.token.toString();
   notifyListeners();
  }

}