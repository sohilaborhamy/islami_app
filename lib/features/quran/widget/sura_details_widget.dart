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
          
          Stack(
            alignment: Alignment.center, 
            children: [
              
              Image.asset(
                AssetsApp.suraNumberIcon,
                width: 52, 
                height: 52,
              ),

             
              Text(
                "${surahData.id}",
                style: const TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
            ],
          ),
          const SizedBox(
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
              const SizedBox(
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
          const Spacer(),
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
