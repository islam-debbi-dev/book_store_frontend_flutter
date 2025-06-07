import 'package:flutter/material.dart';
import 'widgets/theme_switch_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: const [
          ThemeSwitchTile(),
        ],
      ),
    );
  }
}
