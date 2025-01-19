import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets_app.dart';
import 'package:islami_app/core/theme/colors_app.dart';
import 'package:islami_app/features/hadith/hadith_page.dart';

import 'package:islami_app/features/layout/widgets/custom_nav_bar_item.dart';





import '../bearish/bearish_page.dart';
import '../quran/quran_page.dart';
import '../radio/radio_page.dart';
import '../timer/timer_page.dart';




class LayoutPage extends StatefulWidget {
  static String routeName = "/Layout";
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    QuranPage(),
    HadithPage(),
    BearishPage(),
    RadioPage(),
    TimerPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsApp.primaryColor,
        fixedColor: ColorsApp.whiteColor,
        showUnselectedLabels: false,
        items: [
           BottomNavigationBarItem(
              icon: 
              CustomNavBarItem(iconPath:AssetsApp.quranIcon ,
              selectedIndex: selectedIndex,
              navBarItem: 0,
              ),
              
             label: "Quran"),
          BottomNavigationBarItem(
              icon:  CustomNavBarItem(iconPath:AssetsApp.hadithIcon ,
              selectedIndex: selectedIndex,
              navBarItem: 1,
              ),
             
              label: "Hadith"),
          BottomNavigationBarItem(
              icon:  CustomNavBarItem(iconPath:AssetsApp.bearishIcon ,
              selectedIndex: selectedIndex,
              navBarItem: 2,
              ),
              label: "Bearish"),
          BottomNavigationBarItem(
              icon:  CustomNavBarItem(iconPath:AssetsApp.radioIcon ,
              selectedIndex: selectedIndex,
              navBarItem: 3,
              ),
              label: "Radio"),
          BottomNavigationBarItem(
              icon:  CustomNavBarItem(iconPath:AssetsApp.timerIcon ,
              selectedIndex: selectedIndex,
              navBarItem: 4,
              ),
              label: "Timer"),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
