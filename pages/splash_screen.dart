import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:takfoodowner/pages/home_app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _init(context);
    return Scaffold(
        body: Center(
      child: SvgPicture.asset(
        'assets/images/logo.svg',
        color: Theme.of(context).primaryColor,
        height: 80,
      ),
    ));
  }

  _init(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeApp())),
    );
  }
}
