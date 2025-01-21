import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/constants/assets_app.dart';
import '../../core/theme/colors_app.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool isVolume = true;
  final ScrollController scrollController = ScrollController();
  final List<Map<String, String>> prayerTimes = [
    {'name': 'Fajr', 'time': '04:41', 'time1': 'AM'},
    {'name': 'Sunrise', 'time': '06:05', 'time1': 'AM'},
    {'name': 'Dhuhr', 'time': '01:01', 'time1': 'PM'},
    {'name': 'Asr', 'time': '04:38', 'time1': 'PM'},
    {'name': 'Maghrib', 'time': '07:57', 'time1': 'PM'},
    {'name': 'Isha', 'time': '09:10', 'time1': 'PM'},
  ];

  Timer? timer;

  @override
  void initState() {
    super.initState();
    startAutoScroll();
  }

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(minutes: 1), (_) {
      final now = DateTime.now();
      for (int i = 0; i < prayerTimes.length; i++) {
        final prayerTime = prayerTimes[i]['time']!;
        final prayerDateTime = parseTime(prayerTime);
        if (now.isBefore(prayerDateTime)) {
          scrollToIndex(i);
          break;
        }
      }
    });
  }

  DateTime parseTime(String time) {
    final format = time.contains('AM') ? 'AM' : 'PM';
    final hoursMinutes = time.replaceAll(RegExp(r'[APM\s]'), '');
    final parts = hoursMinutes.split(':').map(int.parse).toList();
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      format == 'AM' ? parts[0] : (parts[0] + 12),
      parts[1],
    );
  }

  void scrollToIndex(int index) {
    final offset = index * 100.0;
    scrollController.animateTo(
      offset,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsApp.timerBackground),
          fit: BoxFit.cover,
        ),
      ),
     
       
       child:  SingleChildScrollView(
          child: SafeArea(
            child: Column(
             
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               
                 Image(
                  image: AssetImage(AssetsApp.logo),
                ),
                
               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    height: height * 0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/praytime.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4, left: 13, right: 13),
                          child: Row(
                            children: [
                              Text(
                                '16 Jul,\n2024',
                                style: TextStyle(
                                  color: ColorsApp.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Pray Time\n Tuesday',
                                style: TextStyle(
                                  color: ColorsApp.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '09 Muh,\n1446',
                                style: TextStyle(
                                  color: ColorsApp.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: height * 0.17,
                          child: ListView.builder(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: prayerTimes.length,
                            itemBuilder: (BuildContext context, int index) {
                              final prayer = prayerTimes[index];
                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/praytime1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      prayer['name']!,
                                      style: TextStyle(
                                        color: ColorsApp.whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      prayer['time']!,
                                      style: TextStyle(
                                        color: ColorsApp.whiteColor,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      prayer['time1']!,
                                      style: TextStyle(
                                        color: ColorsApp.whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 70),
                            Text(
                              'Next Pray:-${prayerTimes[0]['time']}',
                              style: TextStyle(
                                color: ColorsApp.secondColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 45),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isVolume = !isVolume;
                                });
                              },
                              icon: Icon(
                                isVolume ? Icons.volume_up : Icons.volume_off,
                                size: 25,
                                color: ColorsApp.secondColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '  Azkar',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorsApp.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: ColorsApp.primaryColor, width: 1),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/azkar1.png',
                              height: 133,
                              width: 133,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Morning Azkar',
                              style: TextStyle(
                                color: ColorsApp.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: ColorsApp.primaryColor, width: 1),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/azkar2.png',
                              height: 133,
                              width: 133,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Evening Azkar',
                              style: TextStyle(
                                color: ColorsApp.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      
    );
  }
}
