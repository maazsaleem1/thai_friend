import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/settingsfolder/change_usrename_screen.dart';
import 'package:thai_friendly_app/settingsfolder/delete_account_screen.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  _AppSettingsScreenState createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  bool switchTheme = false;
  bool darkMode = false;
  bool imperialUnits = false;
  bool googleLogin = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SwitchListTile(
            value: switchTheme,
            onChanged: (val) => setState(() => switchTheme = val),
            title: const Text("Switch Theme Automatically"),
          ),
          SwitchListTile(
            value: darkMode,
            onChanged: (val) => setState(() => darkMode = val),
            title: const Text("Dark Mode"),
          ),
          SwitchListTile(
            value: imperialUnits,
            onChanged: (val) => setState(() => imperialUnits = val),
            title: const Text("Imperial Units (miles etc)"),
          ),
          SizedBox(height: 20),
          Text("Login Methods", style: TextStyle(fontWeight: FontWeight.bold)),
          SwitchListTile(
            value: googleLogin,
            onChanged: (val) => setState(() => googleLogin = val),
            title: Text("Log in with Google"),
          ),
          ListTile(
              title: Text("Log in with Email"),
              trailing: Icon(Icons.arrow_forward_ios)),
          GestureDetector(
            onTap: () {
              Get.to(() => ChangeUsernameScreen());
            },
            child: const ListTile(
                title: Text("Change Username"),
                trailing: Icon(Icons.arrow_forward_ios)),
          ),
          const ListTile(
              title: Text("Restore Purchases"),
              trailing: Icon(Icons.arrow_forward_ios)),
          ListTile(title: Text("Log Out")),
          ListTile(title: Text("Turn Off Profile")),
          GestureDetector(
              onTap: () {
                Get.to(const DeleteAccountScreen());
              },
              child: ListTile(title: Text("Delete Account"))),
          ListTile(title: Text("Terms and Conditions")),
          ListTile(title: Text("Privacy Policy")),
          ListTile(title: Text("Dating Safety")),
          ListTile(title: Text("Community Guidelines")),
        ],
      ),
    );
  }
}
