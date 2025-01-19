import 'dart:core';
import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets_app.dart';
import 'package:islami_app/core/service/local_storage.dart';
import 'package:islami_app/core/service/local_storage_keys.dart';
import 'package:islami_app/core/theme/colors_app.dart';
import 'package:islami_app/features/quran/sura_content_page.dart';
import 'package:islami_app/models/sura_data_model.dart';

import 'widget/recent_view_widget.dart';
import 'widget/sura_details_widget.dart';

class QuranPage extends StatefulWidget {
  QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  void initState() {
    super.initState();
    _loadRecentSuras();
  }

  String searchQuery = '';

  List<SurahData> recentDataList = [];
  List<SurahData> searchSuraModel = [];
  List<String> recentSuraIndexList = [];

  List<SurahData> surahList = [
    SurahData(id: 1, arabicName: "الفاتحه", englishName: "Al-Fatiha", ayahs: 7),
    SurahData(
        id: 2, arabicName: "البقرة", englishName: "Al-Baqarah", ayahs: 286),
    SurahData(
        id: 3, arabicName: "آل عمران", englishName: "Aal-E-Imran", ayahs: 200),
    SurahData(id: 4, arabicName: "النساء", englishName: "An-Nisa'", ayahs: 176),
    SurahData(
        id: 5, arabicName: "المائدة", englishName: "Al-Ma'idah", ayahs: 120),
    SurahData(
        id: 6, arabicName: "الأنعام", englishName: "Al-An'am", ayahs: 165),
    SurahData(
        id: 7, arabicName: "الأعراف", englishName: "Al-A'raf", ayahs: 206),
    SurahData(id: 8, arabicName: "الأنفال", englishName: "Al-Anfal", ayahs: 75),
    SurahData(
        id: 9, arabicName: "التوبة", englishName: "At-Tawbah", ayahs: 129),
    SurahData(id: 10, arabicName: "يونس", englishName: "Yunus", ayahs: 109),
    SurahData(id: 11, arabicName: "هود", englishName: "Hud", ayahs: 123),
    SurahData(id: 12, arabicName: "يوسف", englishName: "Yusuf", ayahs: 111),
    SurahData(id: 13, arabicName: "الرعد", englishName: "Ar-Ra'd", ayahs: 43),
    SurahData(id: 14, arabicName: "إبراهيم", englishName: "Ibrahim", ayahs: 52),
    SurahData(id: 15, arabicName: "الحجر", englishName: "Al-Hijr", ayahs: 99),
    SurahData(id: 16, arabicName: "النحل", englishName: "An-Nahl", ayahs: 128),
    SurahData(
        id: 17, arabicName: "الإسراء", englishName: "Al-Isra", ayahs: 111),
    SurahData(id: 18, arabicName: "الكهف", englishName: "Al-Kahf", ayahs: 110),
    SurahData(id: 19, arabicName: "مريم", englishName: "Maryam", ayahs: 98),
    SurahData(id: 20, arabicName: "طه", englishName: "Ta-Ha", ayahs: 135),
    SurahData(
        id: 21, arabicName: "الأنبياء", englishName: "Al-Anbiya", ayahs: 112),
    SurahData(id: 22, arabicName: "الحج", englishName: "Al-Hajj", ayahs: 78),
    SurahData(
        id: 23, arabicName: "المؤمنون", englishName: "Al-Mu'minun", ayahs: 118),
    SurahData(id: 24, arabicName: "النّور", englishName: "An-Nur", ayahs: 64),
    SurahData(
        id: 25, arabicName: "الفرقان", englishName: "Al-Furqan", ayahs: 77),
    SurahData(
        id: 26, arabicName: "الشعراء", englishName: "Ash-Shu'ara", ayahs: 227),
    SurahData(id: 27, arabicName: "النّمل", englishName: "An-Naml", ayahs: 93),
    SurahData(id: 28, arabicName: "القصص", englishName: "Al-Qasas", ayahs: 88),
    SurahData(
        id: 29, arabicName: "العنكبوت", englishName: "Al-Ankabut", ayahs: 69),
    SurahData(id: 30, arabicName: "الرّوم", englishName: "Ar-Rum", ayahs: 60),
    SurahData(id: 31, arabicName: "لقمان", englishName: "Luqman", ayahs: 34),
    SurahData(id: 32, arabicName: "السجدة", englishName: "As-Sajda", ayahs: 30),
    SurahData(
        id: 33, arabicName: "الأحزاب", englishName: "Al-Ahzab", ayahs: 73),
    SurahData(id: 34, arabicName: "سبأ", englishName: "Saba", ayahs: 54),
    SurahData(id: 35, arabicName: "فاطر", englishName: "Fatir", ayahs: 45),
    SurahData(id: 36, arabicName: "يس", englishName: "Ya-Sin", ayahs: 83),
    SurahData(
        id: 37, arabicName: "الصافات", englishName: "As-Saffat", ayahs: 182),
    SurahData(id: 38, arabicName: "ص", englishName: "Sad", ayahs: 88),
    SurahData(id: 39, arabicName: "الزمر", englishName: "Az-Zumar", ayahs: 75),
    SurahData(id: 40, arabicName: "غافر", englishName: "Ghafir", ayahs: 85),
    SurahData(id: 41, arabicName: "فصّلت", englishName: "Fussilat", ayahs: 54),
    SurahData(
        id: 42, arabicName: "الشورى", englishName: "Ash-Shura", ayahs: 53),
    SurahData(
        id: 43, arabicName: "الزخرف", englishName: "Az-Zukhruf", ayahs: 89),
    SurahData(
        id: 44, arabicName: "الدّخان", englishName: "Ad-Dukhan", ayahs: 59),
    SurahData(
        id: 45, arabicName: "الجاثية", englishName: "Al-Jathiya", ayahs: 37),
    SurahData(
        id: 46, arabicName: "الأحقاف", englishName: "Al-Ahqaf", ayahs: 35),
    SurahData(id: 47, arabicName: "محمد", englishName: "Muhammad", ayahs: 38),
    SurahData(id: 48, arabicName: "الفتح", englishName: "Al-Fath", ayahs: 29),
    SurahData(
        id: 49, arabicName: "الحجرات", englishName: "Al-Hujurat", ayahs: 18),
    SurahData(id: 50, arabicName: "ق", englishName: "Qaf", ayahs: 45),
    SurahData(
        id: 51, arabicName: "الذاريات", englishName: "Adh-Dhariyat", ayahs: 60),
    SurahData(id: 52, arabicName: "الطور", englishName: "At-Tur", ayahs: 49),
    SurahData(id: 53, arabicName: "النجم", englishName: "An-Najm", ayahs: 62),
    SurahData(id: 54, arabicName: "القمر", englishName: "Al-Qamar", ayahs: 55),
    SurahData(
        id: 55, arabicName: "الرحمن", englishName: "Ar-Rahman", ayahs: 78),
    SurahData(
        id: 56, arabicName: "الواقعة", englishName: "Al-Waqi'a", ayahs: 96),
    SurahData(id: 57, arabicName: "الحديد", englishName: "Al-Hadid", ayahs: 29),
    SurahData(
        id: 58, arabicName: "المجادلة", englishName: "Al-Mujadila", ayahs: 22),
    SurahData(id: 59, arabicName: "الحشر", englishName: "Al-Hashr", ayahs: 24),
    SurahData(
        id: 60, arabicName: "الممتحنة", englishName: "Al-Mumtahina", ayahs: 13),
    SurahData(id: 61, arabicName: "الصف", englishName: "As-Saff", ayahs: 14),
    SurahData(
        id: 62, arabicName: "الجمعة", englishName: "Al-Jumu'a", ayahs: 11),
    SurahData(
        id: 63,
        arabicName: "المنافقون",
        englishName: "Al-Munafiqun",
        ayahs: 11),
    SurahData(
        id: 64, arabicName: "التغابن", englishName: "At-Taghabun", ayahs: 18),
    SurahData(id: 65, arabicName: "الطلاق", englishName: "At-Talaq", ayahs: 12),
    SurahData(
        id: 66, arabicName: "التحريم", englishName: "At-Tahrim", ayahs: 12),
    SurahData(id: 67, arabicName: "الملك", englishName: "Al-Mulk", ayahs: 30),
    SurahData(id: 68, arabicName: "القلم", englishName: "Al-Qalam", ayahs: 52),
    SurahData(
        id: 69, arabicName: "الحاقة", englishName: "Al-Haqqah", ayahs: 52),
    SurahData(
        id: 70, arabicName: "المعارج", englishName: "Al-Ma'arij", ayahs: 44),
    SurahData(id: 71, arabicName: "نوح", englishName: "Nuh", ayahs: 28),
    SurahData(id: 72, arabicName: "الجن", englishName: "Al-Jinn", ayahs: 28),
    SurahData(
        id: 73, arabicName: "المزّمّل", englishName: "Al-Muzzammil", ayahs: 20),
    SurahData(
        id: 74, arabicName: "المدّثر", englishName: "Al-Muddathir", ayahs: 56),
    SurahData(
        id: 75, arabicName: "القيامة", englishName: "Al-Qiyamah", ayahs: 40),
    SurahData(
        id: 76, arabicName: "الإنسان", englishName: "Al-Insan", ayahs: 31),
    SurahData(
        id: 77, arabicName: "المرسلات", englishName: "Al-Mursalat", ayahs: 50),
    SurahData(id: 78, arabicName: "النبأ", englishName: "An-Naba'", ayahs: 40),
    SurahData(
        id: 79, arabicName: "النازعات", englishName: "An-Nazi'at", ayahs: 46),
    SurahData(id: 80, arabicName: "عبس", englishName: "Abasa", ayahs: 42),
    SurahData(
        id: 81, arabicName: "التكوير", englishName: "At-Takwir", ayahs: 29),
    SurahData(
        id: 82, arabicName: "الإنفطار", englishName: "Al-Infitar", ayahs: 19),
    SurahData(
        id: 83,
        arabicName: "المطفّفين",
        englishName: "Al-Mutaffifin",
        ayahs: 36),
    SurahData(
        id: 84, arabicName: "الإنشقاق", englishName: "Al-Inshiqaq", ayahs: 25),
    SurahData(id: 85, arabicName: "البروج", englishName: "Al-Buruj", ayahs: 22),
    SurahData(id: 86, arabicName: "الطارق", englishName: "At-Tariq", ayahs: 17),
    SurahData(id: 87, arabicName: "الأعلى", englishName: "Al-A'la", ayahs: 19),
    SurahData(
        id: 88, arabicName: "الغاشية", englishName: "Al-Ghashiyah", ayahs: 26),
    SurahData(id: 89, arabicName: "الفجر", englishName: "Al-Fajr", ayahs: 30),
    SurahData(id: 90, arabicName: "البلد", englishName: "Al-Balad", ayahs: 20),
    SurahData(id: 91, arabicName: "الشمس", englishName: "Ash-Shams", ayahs: 15),
    SurahData(id: 92, arabicName: "الليل", englishName: "Al-Lail", ayahs: 21),
    SurahData(id: 93, arabicName: "الضحى", englishName: "Ad-Duha", ayahs: 11),
    SurahData(id: 94, arabicName: "الشرح", englishName: "Ash-Sharh", ayahs: 8),
    SurahData(id: 95, arabicName: "التين", englishName: "At-Tin", ayahs: 8),
    SurahData(id: 96, arabicName: "العلق", englishName: "Al-Alaq", ayahs: 19),
    SurahData(id: 97, arabicName: "القدر", englishName: "Al-Qadr", ayahs: 5),
    SurahData(
        id: 98, arabicName: "البينة", englishName: "Al-Bayyina", ayahs: 8),
    SurahData(
        id: 99, arabicName: "الزلزلة", englishName: "Az-Zalzalah", ayahs: 8),
    SurahData(
        id: 100, arabicName: "العاديات", englishName: "Al-Adiyat", ayahs: 11),
    SurahData(
        id: 101, arabicName: "القارعة", englishName: "Al-Qari'a", ayahs: 11),
    SurahData(
        id: 102, arabicName: "التكاثر", englishName: "At-Takathur", ayahs: 8),
    SurahData(id: 103, arabicName: "العصر", englishName: "Al-Asr", ayahs: 3),
    SurahData(
        id: 104, arabicName: "الهمزة", englishName: "Al-Humazah", ayahs: 9),
    SurahData(id: 105, arabicName: "الفيل", englishName: "Al-Fil", ayahs: 5),
    SurahData(id: 106, arabicName: "قريش", englishName: "Quraysh", ayahs: 4),
    SurahData(
        id: 107, arabicName: "الماعون", englishName: "Al-Ma'un", ayahs: 7),
    SurahData(
        id: 108, arabicName: "الكوثر", englishName: "Al-Kawthar", ayahs: 3),
    SurahData(
        id: 109, arabicName: "الكافرون", englishName: "Al-Kafirun", ayahs: 6),
    SurahData(id: 110, arabicName: "النصر", englishName: "An-Nasr", ayahs: 3),
    SurahData(id: 111, arabicName: "المسد", englishName: "Al-Masad", ayahs: 5),
    SurahData(
        id: 112, arabicName: "الإخلاص", englishName: "Al-Ikhlas", ayahs: 4),
    SurahData(id: 113, arabicName: "الفلق", englishName: "Al-Falaq", ayahs: 5),
    SurahData(id: 114, arabicName: "الناس", englishName: "An-Nas", ayahs: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity ,
      height : double.infinity ,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsApp.quranBackground),
        ),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage(AssetsApp.logo),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  cursorColor: ColorsApp.primaryColor,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: AssetsApp.primaryFont,
                    color: ColorsApp.titleColor,
                  ),
                  onChanged: (value) {
                    searchQuery = value;
                    search();
                    setState(() {});
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Sura Name",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: AssetsApp.primaryFont,
                      color: ColorsApp.titleColor,
                    ),
                    fillColor: ColorsApp.secondColor.withOpacity(0.5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: ColorsApp.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: ColorsApp.primaryColor),
                    ),
                    prefixIcon: ImageIcon(
                      AssetImage(AssetsApp.quranIcon),
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: searchQuery.isEmpty,
                replacement: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => _onSuraTab(searchSuraModel[index].id-1),
                        child: SuraDetailsWidget(
                          surahData: searchSuraModel[index],
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(
                        indent: 50,
                        endIndent: 50,
                      ),
                      itemCount: searchSuraModel.length,
                    ),
                  
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Text(
                        "Most Recently",
                        style: TextStyle(
                          fontFamily: AssetsApp.primaryFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsApp.titleColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 155,
                      child: Visibility(
                        visible: recentDataList.isNotEmpty,
                        
                        replacement: Center(
                          child: Text(
                            "No Recent Sura",
                            style: TextStyle(
                              fontFamily: AssetsApp.primaryFont,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: ColorsApp.primaryColor,
                            ),
                          ),
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => RecentViewWidget(
                            recentData: recentDataList[index],
                          ),
                          itemCount: recentDataList.length,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Text(
                        "Suras List",
                        style: TextStyle(
                          fontFamily: AssetsApp.primaryFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsApp.titleColor,
                        ),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => _onSuraTab(surahList[index].id-1),
                        child: SuraDetailsWidget(
                          surahData: surahList[index],
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(
                        indent: 50,
                        endIndent: 50,
                      ),
                      itemCount: surahList.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onSuraTab(int index) {
    _cacheSuraIndex(index);
    Navigator.of(context).pushNamed(
      SuraContentPage.routeName,
      arguments: surahList[index],
    );
  }

  _cacheSuraIndex(int index) async {
    var indexString = index.toString();
    if (recentSuraIndexList.contains(indexString)) return;
    if (recentSuraIndexList.length == 5) {
      recentSuraIndexList.removeLast();
    }
    recentSuraIndexList.insert(0, indexString);

    await LocalStorageService.setList(
        LocalStorageKeys.recentSuras, recentSuraIndexList);
    _loadRecentSuras();
    setState(() {});
  }

  _loadRecentSuras() {
    recentSuraIndexList = [];
    recentDataList = [];
    recentSuraIndexList =
        LocalStorageService.getStringList(LocalStorageKeys.recentSuras) ?? [];
    for (var index in recentSuraIndexList) {
      var indexInt = int.parse(index);
      recentDataList.add(surahList[indexInt]);
    }
  }

  void search() {
    searchSuraModel = [];
    for (var sura in surahList) {
      if (sura.arabicName.toLowerCase().contains(searchQuery.toLowerCase()) ||
          sura.englishName.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchSuraModel.add(sura);
      }
    }
  }
}
