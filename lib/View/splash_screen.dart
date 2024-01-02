import 'package:flutter/material.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';
import 'package:wallpaper/Utils/color.dart';
import 'package:wallpaper/View/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashView(
        backgroundColor: MyColor.black,
        logo: Container(
          alignment: Alignment.center,
          child: Image.asset('assets/image/logo.png',
            width: 100,
          ),
        ),
        done: Done(const HomeScreen()),
      ),
    );
  }
}

