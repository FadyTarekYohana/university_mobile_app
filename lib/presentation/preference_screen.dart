import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../util/user_preferences.dart';
import 'app_scaffold.dart';

class PreferenceScreen extends ConsumerStatefulWidget {
  const PreferenceScreen({super.key});

  @override
  ConsumerState<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends ConsumerState<PreferenceScreen> {
  late bool darkTheme;
  late String country;
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    darkTheme = UserSimplePreferences.getTheme();
    country = UserSimplePreferences.getCountry();
    super.initState();
  }

  void changeTheme() {
    setState(() {
      if (darkTheme) {
        darkTheme = false;
        UserSimplePreferences.setTheme(darkTheme);
      } else {
        darkTheme = true;
        UserSimplePreferences.setTheme(darkTheme);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dark Theme"),
              Switch(
                value: darkTheme,
                onChanged: (value) {
                  changeTheme();
                  darkTheme
                      ? ref.read(themeProvider.state).state = true
                      : ref.read(themeProvider.state).state = false;
                },
              )
            ],
          ),
          Text(country),
          SizedBox(
            width: 400,
            child: TextField(
              decoration: new InputDecoration(hintText: 'Country'),
              controller: countryController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    UserSimplePreferences.setCountry(countryController.text);
                    country = UserSimplePreferences.getCountry();
                  });
                },
                child: Text("Change Country")),
          )
        ],
      ),
    );
  }
}
