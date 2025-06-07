import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/theme_cubit.dart';

class ThemeSwitchTile extends StatelessWidget {
  const ThemeSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return SwitchListTile(
          title: Text(
              state.themeMode == ThemeMode.dark ? 'Dark Mode' : 'Light Mode'),
          value: state.themeMode == ThemeMode.dark,
          onChanged: (val) async {
            await context.read<ThemeCubit>().toggleTheme();
          },
          secondary: Icon(state.themeMode == ThemeMode.dark
              ? Icons.dark_mode
              : Icons.light_mode),
        );
      },
    );
  }
}
