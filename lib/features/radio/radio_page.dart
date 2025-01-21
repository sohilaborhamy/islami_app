import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets_app.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import '../../core/theme/colors_app.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int? currentSelection = 0;
  bool isPlaying = true;
  bool isVolume = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsApp.radioBackground), fit: BoxFit.cover),
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: MaterialSegmentedControl(
                  children: children,
                  selectionIndex: currentSelection,
                  borderColor: Colors.grey,
                  selectedColor: ColorsApp.primaryColor,
                  unselectedColor: Colors.transparent,
                  selectedTextStyle: const TextStyle(color: Colors.black),
                  unselectedTextStyle: const TextStyle(color: Colors.white),
                  borderWidth: 0.7,
                  borderRadius: 6.0,
                  verticalOffset: 8.0,
                  onSegmentTapped: (index) {
                    setState(() {
                      currentSelection = index;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 141,
                      width: 390,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            isPlaying
                                ? 'assets/images/radio_card.png'
                                : 'assets/images/soundWave.png',
                          ),
                          alignment: isPlaying
                              ? Alignment.center
                              : Alignment.bottomCenter,
                        ),
                        color: ColorsApp.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Radio Ibrahim Al-Akdar',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPlaying = !isPlaying;
                                  });
                                },
                                icon: Icon(
                                  isPlaying ? Icons.play_arrow : Icons.pause,
                                  size: 40,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVolume = !isVolume;
                                  });
                                },
                                icon: Icon(
                                  isVolume ? Icons.volume_up : Icons.volume_off,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Map<int, Widget> children = {
  0: const Text(
    'Radio',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  ),
  1: const Text(
    'Reciters',
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  ),
};
