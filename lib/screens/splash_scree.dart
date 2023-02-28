import 'package:flutter/material.dart';
import 'log_in_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/Big-basket.png',
          cacheWidth: 250,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
