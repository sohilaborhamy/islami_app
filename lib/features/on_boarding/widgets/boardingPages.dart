import 'package:flutter/material.dart';
import 'package:islami_app/core/service/local_storage.dart';
import 'package:islami_app/core/service/local_storage_keys.dart';
import 'package:islami_app/core/theme/colors_app.dart';

import 'package:islami_app/features/on_boarding/pages/fifth_intro_page.dart';
import 'package:islami_app/features/on_boarding/pages/fourth_intro_page.dart';
import 'package:islami_app/features/on_boarding/pages/frist_intro_page.dart';
import 'package:islami_app/features/on_boarding/pages/second_intro_page.dart';
import 'package:islami_app/features/on_boarding/pages/third_intro_page.dart';

import '../../layout/layout_page.dart';

class OnboardingPage extends StatefulWidget {
  static String routeName = "Onboarding";
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    LocalStorageService.setBool(LocalStorageKeys.isFristTimeRun, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              FristIntroPage(),
              SecondIntroPage(),
              ThirdIntroPage(),
              FourthIntroPage(),
              FifthIntroPage(),
            ],
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage > 0
                      ? TextButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                              color: ColorsApp.primaryColor,
                            ),
                          ),
                        )
                      : const SizedBox(width: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: _currentPage == index ? 20 : 10,
                        height: 7,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? ColorsApp.primaryColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage < 4) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                            context, LayoutPage.routeName);
                      }
                    },
                    child: Text(
                      _currentPage == 4 ? "Finish" : "Next",
                      style: TextStyle(
                        color: ColorsApp.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
