import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/user_preferences.dart';

import 'package:flutter_application_1/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await UserSimplePreferences.init();

  runApp(ProviderScope(child: MyApp()));
}

final themeProvider =
    StateProvider<bool>((ref) => UserSimplePreferences.getTheme());

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool darkTheme = ref.watch(themeProvider);
    return MaterialApp.router(
      title: 'Univeristy Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            darkTheme ? const ColorScheme.dark() : const ColorScheme.light(),
      ),
      routerConfig: router,
    );
  }
}
