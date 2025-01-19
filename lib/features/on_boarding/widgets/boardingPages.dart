import 'dart:ffi';

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
      backgroundColor: Colors.black, // Set dark background
      body: Stack(
        children: [
          // PageView for scrolling pages
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              FristIntroPage(), // Corrected typo: FristIntroPage -> FirstIntroPage
              SecondIntroPage(),
              ThirdIntroPage(),
              FourthIntroPage(),
              FifthIntroPage(),
            ],
          ),

          // Bottom navigation with indicators and actions in the same line
          Positioned(
            right: 0,
            left: 0,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Conditionally render the Back action only on the second page
                  _currentPage > 0
                      ? TextButton(
                          onPressed: () {
                            // Navigate to the previous page
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                              color: ColorsApp
                                  .primaryColor, // Text color (replace with your primary color)
                            ),
                          ),
                        )
                      : const SizedBox(
                          width: 48), // Placeholder to maintain layout balance

                  // Page indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5, // Number of pages
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: _currentPage == index ? 20 : 10, // Size change
                        height: 7,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? ColorsApp
                                  .primaryColor // Active color (replace with your primary color)
                              : Colors.grey, // Inactive color
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  // Next action on the right side for both pages
                  TextButton(
                    onPressed: () {
                      if (_currentPage < 4) {
                        // Navigate to the next page
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // Final action (e.g., navigate to home or login screen)
                        Navigator.pushReplacementNamed(context,
                            LayoutPage.routeName); // Adjust "/home" as needed
                      }
                    },
                    child: Text(
                      _currentPage == 4 ? "Finish" : "Next",
                      style: TextStyle(
                        color: ColorsApp
                            .primaryColor, // Text color (replace with your primary color)
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
