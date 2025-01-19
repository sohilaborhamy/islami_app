import 'package:flutter/cupertino.dart';
import 'package:islami_app/core/constants/assets_app.dart';
import 'package:islami_app/core/theme/colors_app.dart';
import 'package:islami_app/models/sura_data_model.dart';

import '../../../../models/recent_data.dart';


class RecentViewWidget extends StatelessWidget {
  final SurahData recentData;
  const RecentViewWidget({
    super.key, required this.recentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsApp.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                recentData.englishName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                recentData.arabicName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${recentData.ayahs} Verses",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Image.asset(AssetsApp.alanbiyaPic),
        ],
      ),
    );
  }
}
