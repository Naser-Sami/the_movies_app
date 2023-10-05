// ignore_for_file: constant_identifier_names

import '/core/core.dart';

const String ENGLISH = 'en';
const String ARABIC = 'ar';

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}