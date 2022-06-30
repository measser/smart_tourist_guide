import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  final Widget widget;

  const SplashScreen({Key? key, required this.widget}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: AppColors.backgroundColor,
      colors: [
        AppColors.primaryColor,
      ],
      text: 'SMART TOURIST GUIDE',
      duration: 2470,
      speed: 180,
      navigateRoute: widget.widget,
      imageSrc: "assets/images/logo.png",
      imageSize: 350,
      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
  }
}
