import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String ESPANOL = 'es';
const String ARABIC = 'ar';
const String HINDI = 'hi';
const String FRENCH = 'fr';
const String SWAHILI = 'sw';
const String ZULU = 'zu';
const String DEUTSCH = 'de';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case ESPANOL:
      return const Locale(ESPANOL, "");
    case ARABIC:
      return const Locale(ARABIC, '');
    case HINDI:
      return const Locale(HINDI, '');
    case FRENCH:
      return const Locale(FRENCH, '');
    case SWAHILI:
      return const Locale(SWAHILI, '');
    case ZULU:
      return const Locale(ZULU, '');
    case DEUTSCH:
      return const Locale(DEUTSCH, '');

    default:
      return const Locale(ENGLISH, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}
