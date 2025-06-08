import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_state.dart';

final String localeKey = 'locale';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(Locale initLocale) : super(LocaleState(locale: initLocale));

  void switchLocale(Locale locale) {
    print(locale);
    emit(LocaleState(locale: locale));
  }

  // save locale to shared preferences
  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(localeKey, locale.languageCode);
  }

  // load locale
  static Future<Locale> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(localeKey) ?? 'en';
    return Locale(languageCode);
  }
}
