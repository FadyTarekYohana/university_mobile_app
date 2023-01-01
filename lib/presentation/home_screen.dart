import 'package:flutter/material.dart';
import 'package:network_image_search/network_image_search.dart';

import '../model/post.dart';
import '../service/posts_service.dart';
import 'app_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = <Post>[];
  late var fav;
  late var icon;
  var isLoaded = false;

  getData() async {
    posts = await PostsService().getUniversities();

    if (posts.isNotEmpty) {
      setState(() {
        isLoaded = true;
        fav = List.filled(posts.length, false);
        icon = List.filled(posts.length, Icon(Icons.star_border_outlined));
      });
    }
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Unsplash(
                      height: 100,
                      width: 100,
                      category: "university $index",
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(posts[index].name.toString()),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          print(fav[index]);
                          setState(() {
                            if (fav[index] == true) {
                              fav[index] = false;
                              icon[index] = Icon(Icons.star);
                            } else {
                              fav[index] = true;
                              icon[index] = Icon(Icons.star_border_outlined);
                            }
                            print(fav[index]);
                          });
                        },
                        icon: icon[index]),
                  ],
                );
              })),
    );
  }
}
