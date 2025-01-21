import 'package:flutter/material.dart';

import '../../../core/constants/assets_app.dart';
import '../../../core/theme/colors_app.dart';
class BearishPage extends StatefulWidget {
  const BearishPage({super.key});

  @override
  State<BearishPage> createState() => _BearishPageState();
}
class _BearishPageState extends State<BearishPage> {
  int _counter = 0;
  double turns = 0.0;
  int index = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا اله الا الله',
    'استغفر الله',
    'لا حول ولا قوة الا بالله',
    'سبحان الله وبحمده',
    'سبحان الله العظيم',
    'اللهم صل وسلم وبارك على محمد',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(AssetsApp.bearishBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        autofocus: false,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() => turns += 1 / 33);
          _counter++;
          if (_counter == 33) {
            _counter = 0;
            index++;
          }
          if (index == azkar.length) {
            index = 0;
          }
        },
        
         
          child: SafeArea(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               
                Image(
                  image: AssetImage(AssetsApp.logo),
                ),
               
                Center(
                  child: Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: ColorsApp.whiteColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              azkar[index],
                              style: TextStyle(
                                color: ColorsApp.whiteColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$_counter',
                              style: TextStyle(
                                color: ColorsApp.whiteColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        AnimatedRotation(
                          turns: turns,
                          duration: const Duration(milliseconds: 50),
                          child: Image.asset(
                            'assets/images/SebhaBody.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        
      ),
    );
  }
}