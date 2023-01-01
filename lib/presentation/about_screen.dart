import 'package:flutter/cupertino.dart';
import 'package:network_image_search/network_image_search.dart';

import 'app_scaffold.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Unsplash(
              height: 200,
              width: 200,
              category: "computer",
              subcategory: "code",
            ),
          ),
          const Text(
            "Fady Tarek Yohana",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "2019/00456",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
