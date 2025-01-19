import 'package:flutter/material.dart';
import 'package:islami_app/core/service/local_storage.dart';

import 'package:islami_app/features/on_boarding/pages/frist_intro_page.dart';
import 'package:islami_app/features/on_boarding/pages/second_intro_page.dart';
import 'package:islami_app/features/on_boarding/widgets/boardingPages.dart';
import 'package:islami_app/features/splash/pages/splash_page.dart';

import 'features/layout/layout_page.dart';
import 'features/quran/sura_content_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (_) => const SplashPage(),
          FristIntroPage.routeName: (_) => const FristIntroPage(),
          SecondIntroPage.routeName: (_) => const SecondIntroPage(),
          OnboardingPage.routeName: (_) => const OnboardingPage(),
          LayoutPage.routeName: (_) => const LayoutPage(),
          SuraContentPage.routeName: (_) => const SuraContentPage(),
        });
  }
}
