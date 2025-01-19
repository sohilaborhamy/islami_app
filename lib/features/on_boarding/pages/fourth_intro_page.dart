import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets_app.dart';
import 'package:islami_app/core/theme/colors_app.dart';

class FourthIntroPage extends StatelessWidget {
  static String routeName = "FourthIntro";
  const FourthIntroPage({super.key});

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
                AssetsApp.frameFour,
                width: size.width * 0.80,
              ),
            ),
           Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 180),
                child: Text(
                  "Bearish",
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
                  " Praise the name of your Lord, the Most High",
                  style: TextStyle(
                    color: ColorsApp.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: AssetsApp.primaryFont,
                    fontSize: 20,
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
