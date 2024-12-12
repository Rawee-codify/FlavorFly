
import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocaleData.EN),
];

mixin LocaleData {
  static const String test = "test";

  static const Map<String, dynamic> EN = {
    test: "Test",
  };

//other language strings
}
