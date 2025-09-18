

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewmodel extends ChangeNotifier {

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController get getConfirmPasswordController =>
      _ConfirmPasswordController;
  TextEditingController _ConfirmPasswordController = TextEditingController();
  String get getConfirmPasswordFieldError => _ConfirmPasswordFieldError;
  TextEditingController get getFullNameController => _fullNameController;
  TextEditingController _fullNameController = TextEditingController();

  String _passwordFieldError = '';
  String _emailFieldError = '';
  bool _securePassword = true;
  bool _confrimsecurePassword = true;
  String _ConfirmPasswordFieldError = '';
  String _nameFieldError = '';
  
  

  void setPasswordFieldError(String value) {
    _passwordFieldError = value;
    notifyListeners();
  }

   void setEmailFieldError(String value) {
    _emailFieldError = value;
    notifyListeners();
  }

  void setSecurePassword() {
    _securePassword = !_securePassword;
    notifyListeners();
  }

  void setConfrimSecurePassword() {
    _confrimsecurePassword = !_confrimsecurePassword;
    notifyListeners();
  }

  TextEditingController get getPasswordController => _passwordController;
  TextEditingController get getemailController => _emailController;
  String get getpasswordFieldError => _passwordFieldError;
  String get getemailFieldError => _emailFieldError;
  bool get getsecurePassword => _securePassword;
  bool get getsecureconfrimPassword => _confrimsecurePassword;
  String get getnameFieldError => _nameFieldError;

  bool passwordValidation() {
    if (_passwordController.text.isEmpty) {
      setPasswordFieldError('Please Enter Password');
      return false;
    } else if (_passwordController.text.length < 8) {
      print(_passwordController.text.length);
      setPasswordFieldError('Password length must be of 8 characters or more');
      return false;
    } else {
      setPasswordFieldError('');
      return true;
    }
  }

  bool emailValidation() {
    if (_emailController.text.isEmpty) {
      setEmailFieldError('Please Enter Email');
      return false;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text)) {
      setEmailFieldError('Please Enter Valid Email');
      return false;
    } else {
      setEmailFieldError('');
      return true;
    }
  }

  bool signInValidation() {
    if (emailValidation() && passwordValidation()) {
      return true;
    } else {
      return false;
    }
  }
}