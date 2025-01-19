import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets_app.dart';
import 'package:islami_app/core/service/local_storage.dart';
import 'package:islami_app/core/service/local_storage_keys.dart';
import 'package:islami_app/features/on_boarding/widgets/boardingPages.dart';
import '../../layout/layout_page.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "Splash";
  static Duration _duration = Duration(milliseconds: 1500);
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        var isFristTime = LocalStorageService.getBool(LocalStorageKeys.isFristTimeRun)?? true;
        Navigator.pushReplacementNamed(context, isFristTime? OnboardingPage.routeName :
        LayoutPage.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          AssetsApp.splashBackground,
        ),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FadeInDown(
                duration: SplashPage._duration,
                child: Image.asset(
                  AssetsApp.splashGlow,
                  height: size.height * 0.30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AssetsApp.splashMosque,
                height: size.height * 0.30,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ZoomIn(
                duration: SplashPage._duration,
                child: Image.asset(
                  AssetsApp.splashLogo,
                  height: size.height * 0.30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ZoomIn(
                duration: SplashPage._duration,
                child: Image.asset(
                  AssetsApp.islamiLogo,
                  height: size.height * 0.75,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FadeInUp(
                duration: SplashPage._duration,
                child: Image.asset(
                  AssetsApp.branding,
                  height: size.height * 0.20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FadeInLeft(
                  duration: SplashPage._duration,
                  child: Image.asset(
                    AssetsApp.splashLeft,
                    height: size.height * 0.25,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.30),
              child: Align(
                alignment: Alignment.centerRight,
                child: FadeInRight(
                  duration: SplashPage._duration,
                  child: Image.asset(
                    AssetsApp.splashRightBottom,
                    height: size.height * 0.25,
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
