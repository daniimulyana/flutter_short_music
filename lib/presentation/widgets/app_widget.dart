import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_short_music/presentation/pages/app_splash.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Short Music',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: kDebugMode,
      home: const AppSplash(),
    );
  }
}
