import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:task_app/models/colors.dart';
import 'package:task_app/screens/task_screen.dart';
import 'package:task_app/widgets/pickColor.dart';

class Settings extends StatefulWidget {
  var color;
  Settings(this.color);
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: widget.color,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TasksScreen(widget.color)));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SettingsList(
        contentPadding: const EdgeInsets.all(0),
        sections: [
          SettingsSection(
            title: const Text(
              'Appearance',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Change App Color'),
                value: const Text(''),
                onPressed: (context) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PickColor(widget.color)));
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: false,
                leading: const Icon(Icons.format_paint),
                title: const Text('Enable dark theme'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
