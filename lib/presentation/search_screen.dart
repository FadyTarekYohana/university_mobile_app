import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_image_search/network_image_search.dart';
import 'package:search_page/search_page.dart';

import '../model/post.dart';
import '../service/posts_service.dart';
import 'app_scaffold.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Post> posts = <Post>[];
  TextEditingController editingController = TextEditingController();

  var isLoaded = false;

  getData() async {
    posts = await PostsService().getUniversities();

    if (posts.isNotEmpty) {
      setState(() {
        isLoaded = true;
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
      child: Scaffold(
        body: Visibility(
            visible: isLoaded,
            replacement: const Center(child: CircularProgressIndicator()),
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index].name.toString()),
                  );
                })),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Search people',
          onPressed: () => showSearch(
            context: context,
            delegate: SearchPage(
              items: posts,
              searchLabel: 'Search University',
              failure: const Center(
                child: Text('No matches'),
              ),
              filter: (university) => [
                university.name.toString(),
              ],
              builder: (university) => ListTile(
                title: Text(university.name.toString()),
              ),
            ),
          ),
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
