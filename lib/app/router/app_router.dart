import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unitask/app/router/app_page.dart';
import 'package:unitask/ui/pages/login/login_page.dart';

final appRouter = GoRouter(
  initialLocation: AppPage.login.path, // 첫 페이지의 이름 지정
  routes: [
    GoRoute(
      name: AppPage.login.name,
      path: AppPage.login.path,
      builder: (context, state) => const LoginPage(),
      ),
  ],
);