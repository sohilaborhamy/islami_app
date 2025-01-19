import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/colors_app.dart';
import 'package:islami_app/models/recent_data.dart';
import 'package:islami_app/models/sura_data_model.dart';

import '../../../../core/constants/assets_app.dart';

class SuraDetailsWidget extends StatelessWidget {
  final SurahData surahData;
  

  const SuraDetailsWidget({
    super.key,
   required this.surahData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          // Stack to overlay the number on top of the icon
          Stack(
            alignment: Alignment.center, // Center the number inside the icon
            children: [
              // Sura number icon
              Image.asset(
                AssetsApp.suraNumberIcon,
                width: 52, // Adjust the size of the icon as needed
                height: 52,
              ),

              // Sura number text
              Text(
                "${surahData.id}",
                style: TextStyle(
                  fontSize: 16, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Adjust the text color as needed
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surahData.englishName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.whiteColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${surahData.ayahs} Verses",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.whiteColor,
                ),
              )
            ],
          ),
          Spacer(),
          Text(
            surahData.arabicName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorsApp.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
