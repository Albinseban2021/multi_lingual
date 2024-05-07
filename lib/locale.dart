import 'package:flutter_localization/flutter_localization.dart';

 List<MapLocale> LOCALES = [
  MapLocale('en', AppLocale.EN),
  MapLocale('hi', AppLocale.HI),
  MapLocale('tn', AppLocale.TN),
];
mixin AppLocale {
  static const String title = 'title';
  static const String body = 'body';

  static  Map<String, dynamic> EN = {
    title: 'Hello',
    body: 'Welcome to the Home page'
  };

  static  Map<String, dynamic> HI = {
    title: 'नमस्ते',
    body: 'मुखपृष्ठ में स्वागत है'
  };
  static  Map<String, dynamic> TN = {
    title: 'வணக்கம்',
    body: 'முகப்புப் பக்கத்திற்கு வரவேற்கிறோம்'
  };
}
