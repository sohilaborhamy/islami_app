import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:islami_app/models/sura_data_model.dart';

import '../../core/constants/assets_app.dart';
import '../../core/theme/colors_app.dart';

class SuraContentPage extends StatefulWidget {
  static const String routeName = 'SuraContentPage';

  const SuraContentPage({super.key});

  @override
  State<SuraContentPage> createState() => _SuraContentPageState();
}

class _SuraContentPageState extends State<SuraContentPage> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahData;
    if (ayat.isEmpty)
    loadData(args.id.toString());

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsApp.primaryColor),
        centerTitle: true,
        title: Text(
          args.englishName,
          style: TextStyle(
            color: ColorsApp.primaryColor,
            fontWeight: FontWeight.w700,
            fontFamily: AssetsApp.primaryFont,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          bottom: 100,
          right: 20,
          left: 20,
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/contentScreen_bg.png'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Text(
              "${args.arabicName}",
              style: TextStyle(
                  color: ColorsApp.primaryColor,
                  fontWeight: FontWeight.w700,
                   fontFamily: AssetsApp.primaryFont,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Text(
                  " [${index+1}] ${ayat[index]} ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AssetsApp.primaryFont,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.primaryColor,
                  ),
                ),
                itemCount: ayat.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadData(String suraID) async {
    String content = await rootBundle.loadString("assets/files/$suraID.txt");
    setState(() {
      ayat = content.split("\n");
    });
  }
}
