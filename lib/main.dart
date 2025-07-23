import 'package:application_2_leveel_1/splash/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FirutsStore());
}

class FirutsStore extends StatelessWidget {
  const FirutsStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}
