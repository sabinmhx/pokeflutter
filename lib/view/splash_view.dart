import 'package:flutter/material.dart';
import 'package:pokemon_app_graphql/view/home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/icon.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
