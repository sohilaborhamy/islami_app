import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets_app.dart';
import 'package:islami_app/core/theme/colors_app.dart';

class FifthIntroPage extends StatelessWidget {
  static String routeName = "FifthIntro";
  const FifthIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        backgroundColor: ColorsApp.secondColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AssetsApp.splashMosque,
                height: size.height * 0.30,
                width: size.width * 0.65,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AssetsApp.islamiLogo,
                height: size.height * 0.38,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetsApp.frameFive,
                width: size.width * 0.80,
              ),
            ),
           Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: Text(
                  "Holy Quran Radio",
                  style: TextStyle(
                    color: ColorsApp.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: AssetsApp.primaryFont,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Text(
                   textAlign: TextAlign.center,
                  " You can listen to the Holy Quran Radio through the application for free and easily",
                  style: TextStyle(
                    color: ColorsApp.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: AssetsApp.primaryFont,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
