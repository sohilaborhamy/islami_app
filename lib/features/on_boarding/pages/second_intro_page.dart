import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets_app.dart';
import 'package:islami_app/core/theme/colors_app.dart';

class SecondIntroPage extends StatelessWidget {
  static String routeName = "SecondIntro";
  const SecondIntroPage({super.key});

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
                AssetsApp.frameTwo,
                width: size.width * 0.80,
              ),
            ),
           Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: Text(
                  "Welcome To Islami",
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
                  "We Are Very Excited To Have You In Our Community",
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
