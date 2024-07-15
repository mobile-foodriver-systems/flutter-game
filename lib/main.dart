import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_driver/features/auth/presentation/pages/auth_page.dart';
import 'package:food_driver/core/theme/theme_data.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(context),
      home: const AuthPage(),
    );
  }
}
