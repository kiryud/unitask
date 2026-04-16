import 'package:flutter/material.dart';
import 'package:unitask/ui/pages/login/login_page.dart';
import 'package:unitask/ui/pages/signup/signup_page.dart';

enum AppPage {
  login, signup
}


extension AppPageExtention on AppPage {
  String get path => '/$name';

  Widget get page => switch (this) {
    .login => const LoginPage(),
    .signup => const SignupPage(),
  };
}