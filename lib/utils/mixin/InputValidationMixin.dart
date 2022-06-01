
mixin InputValidationMixin {

  /// method to check alpha numeric password
  bool isUserValid(String userName) {
    return userName.length >= 2;
  }

  /// method to check alpha numeric password
  bool isPasswordValid(String password) {
    return password.length >= 8;
  }

  /// method to check email validation
  bool isEmailValid(String email) {
   return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

}