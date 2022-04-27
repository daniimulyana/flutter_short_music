import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_short_music/presentation/pages/home_page.dart';

class AppSplash extends StatefulWidget {
  const AppSplash({Key? key}) : super(key: key);

  @override
  _AppSplashState createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer(
      const Duration(seconds: 2),
          () => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
            (route) => false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/i_fruit.webp'),
            ),
          ),
        ),
      ),
    );
  }
}