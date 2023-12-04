
// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qart_fashion/model/author_model.dart';
import 'package:qart_fashion/model/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:qart_fashion/view/post_details_screen.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> postsJson = json.decode(response.body);
      List<Post> postsList = [];

      for (var postData in postsJson) {
        final authorResponse = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/${postData["userId"]}'));
        if (authorResponse.statusCode == 200) {
          final Author author = Author.fromJson(json.decode(authorResponse.body));
          final Post post = Post.fromJson({
            'id': postData['id'],
            'title': postData['title'],
            'body': postData['body'],
            'author': author,
          });
          postsList.add(post);
        }
      }

      setState(() {
        posts = postsList;
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index].title),
            subtitle: Text('Author: ${posts[index].author["name"]}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailsScreen(post: posts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
