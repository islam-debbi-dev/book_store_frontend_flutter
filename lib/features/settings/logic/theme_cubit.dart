import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booke_store/core/helpers/shared_pref_helper.dart';
part 'theme_state.dart';

const String themeModeKey = 'theme_mode';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(ThemeMode initialMode) : super(ThemeState(themeMode: initialMode));

  static Future<ThemeMode> getSavedThemeMode() async {
    final String mode = await SharedPrefHelper.getString(themeModeKey);
    if (mode == 'dark') return ThemeMode.dark;
    if (mode == 'light') return ThemeMode.light;
    return ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final ThemeMode newMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeState(themeMode: newMode));
    await SharedPrefHelper.setData(
        themeModeKey, newMode == ThemeMode.dark ? 'dark' : 'light');
  }

  Future<void> setTheme(ThemeMode mode) async {
    emit(ThemeState(themeMode: mode));
    await SharedPrefHelper.setData(
        themeModeKey, mode == ThemeMode.dark ? 'dark' : 'light');
  }
}
