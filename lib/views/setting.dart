import 'package:flutter/material.dart';
import 'package:kelompok/views/login.dart';
import 'package:kelompok/main.dart';

bool darkModeEnabled = false;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationEnabled = false;

  void _toggleNotification(bool value) {
    setState(() {
      _notificationEnabled = value;
    });
  }

  ThemeMode _themeMode = ThemeMode.system;
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  void _logout() {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Enable Notifications'),
              trailing: Switch(
                value: _notificationEnabled,
                onChanged: _toggleNotification,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.light_mode),
              title: Text(
                'Dark Mode',
              ),
              trailing: Switch(
                value: darkModeEnabled,
                onChanged: (bool value) {
                  MyApp.themeNotifier.value =
                      MyApp.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                  setState(() {
                    darkModeEnabled = value;
                  });
                },
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.security),
              title: Text('Privacy'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
