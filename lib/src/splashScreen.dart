import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/mainPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashSscreenState();
}

class _SplashSscreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(
        Duration(milliseconds: 3000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            SizedBox(height: 50),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
