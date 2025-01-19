class SurahData {
  final int id;
  final String arabicName;
  final String englishName;
  final int ayahs;

  SurahData({required this.id, required this.arabicName, required this.englishName, required this.ayahs});

  @override
  String toString() {
    return 'SurahData(ID: $id, Arabic: $arabicName, English: $englishName, Ayahs: $ayahs)';
  }
}