import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:islami_app/core/theme/colors_app.dart';

import 'data/hadith_model.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../core/constants/assets_app.dart';

class HadithPage extends StatefulWidget {
  const HadithPage({super.key});

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  List<HadethModal> hadethMatnList = [];

  @override
  void initState() {
    super.initState();
    loadHadethMatn();
  }

  void loadHadethMatn() async {
    for (int i = 1; i <= 50; i++) {
      String hadethMatn = await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadethLines = hadethMatn.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModal hadethModal = HadethModal(title: title, matn: hadethLines);
      hadethMatnList.add(hadethModal);
    }
    setState(() {});
  }

  @override
  @override
Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(AssetsApp.hadithBackground),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/logo.png',
        ),
        
        Expanded(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.7,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 0,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            ),
            itemCount: hadethMatnList.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/hadethCard_bg.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(30),
                color: ColorsApp.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 35),
                    Text(
                      hadethMatnList[itemIndex].title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          hadethMatnList[itemIndex].matn.join(''),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}