import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/colors_app.dart';

class CustomNavBarItem extends StatelessWidget {
  final int selectedIndex;
  final int navBarItem;
   final String iconPath;
  const CustomNavBarItem(
      {super.key, required this.selectedIndex, required this.navBarItem, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: selectedIndex == navBarItem
            ? ColorsApp.secondColor.withOpacity(0.5)
            : Colors.transparent,
      ),
      child: ImageIcon(
        AssetImage(iconPath)),
      
    );
  }
}
