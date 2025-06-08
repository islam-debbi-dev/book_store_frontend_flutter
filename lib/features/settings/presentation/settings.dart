import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/localization/cubit/locale_cubit.dart';
import 'widgets/theme_switch_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.translate('settings') ?? 'Settings'),
      ),
      body: Column(
        children: const [
          ThemeSwitchTile(),
          // Add more settings options here
          LanguageSwitchTile(),
        ],
      ),
    );
  }
}

class LanguageSwitchTile extends StatefulWidget {
  const LanguageSwitchTile({super.key});

  @override
  State<LanguageSwitchTile> createState() => _LanguageSwitchTileState();
}

class _LanguageSwitchTileState extends State<LanguageSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(AppLocalizations.of(context)?.translate('language') ??
                  'Language'),
              ElevatedButton(
                onPressed: () {
                  context.read<LocaleCubit>().switchLocale(const Locale('en'));
                  context.read<LocaleCubit>().saveLocale(const Locale('en'));
                },
                child: Text(
                    AppLocalizations.of(context)?.translate('english') ??
                        'English'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<LocaleCubit>().switchLocale(const Locale('ar'));
                  context.read<LocaleCubit>().saveLocale(const Locale('ar'));
                },
                child: Text(AppLocalizations.of(context)?.translate('arabic') ??
                    'العربية'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
