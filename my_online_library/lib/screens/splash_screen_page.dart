import 'dart:async'; // Timer için gerekli

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_library/bloc/theme/theme_bloc.dart';
import 'package:my_online_library/screens/bottom_bar_page.dart';

//uygulamanın başlangıç sayfası
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    Timer(
      const Duration(seconds: 3), // Splash ekranının gösterilme süresi
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const BottomBarPage(), // Sayfa yönlendirme
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Tema modunu Bloc'tan al
    final themeMode = context.watch<ThemeBloc>().state;
    final imagePath = themeMode == ThemeMode.dark
        ? 'assets/images/logo-dark.png'
        : 'assets/images/logo.png';

    return Scaffold(
      body: Center(
        child: Image.asset(imagePath), // Temaya göre resim gösterme
      ),
    );
  }
}
