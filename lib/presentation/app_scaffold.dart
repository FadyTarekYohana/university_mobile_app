import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: SafeArea(
            top: true,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: const Text("Home"),
                  onTap: () => context.go("/"),
                ),
                ListTile(
                  title: const Text("Search"),
                  onTap: () => context.go("/search"),
                ),
                ListTile(
                  title: const Text("Preference"),
                  onTap: () => context.go("/preference"),
                ),
                ListTile(
                  title: const Text("About"),
                  onTap: () => context.go("/about"),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text("Univeristy Application"),
        ),
        body: Center(
          child: child,
        ));
  }
}
