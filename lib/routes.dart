import 'package:go_router/go_router.dart';

import 'presentation/about_screen.dart';
import 'presentation/home_screen.dart';
import 'presentation/preference_screen.dart';
import 'presentation/search_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: "/search",
    builder: (context, state) => const SearchScreen(),
  ),
  GoRoute(
    path: "/preference",
    builder: (context, state) => const PreferenceScreen(),
  ),
  GoRoute(
    path: "/about",
    builder: (context, state) => const AboutScreen(),
  ),
]);
