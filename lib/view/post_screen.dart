
// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, unnecessary_null_comparison

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
  late List<Post> posts = [];
  late List<Author> authors = [];

  @override
  void initState() {
    super.initState();
    fetchPostsAndAuthors();
  }

  Future<void> fetchPostsAndAuthors() async {
    final postsResponse = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final authorsResponse = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (postsResponse.statusCode == 200 && authorsResponse.statusCode == 200) {
      List<Post> fetchedPosts = (json.decode(postsResponse.body) as List)
          .map((data) => Post.fromJson(data))
          .toList();

      List<Author> fetchedAuthors = (json.decode(authorsResponse.body) as List)
          .map((data) => Author.fromJson(data))
          .toList();

      setState(() {
        posts = fetchedPosts;
        authors = fetchedAuthors;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: posts == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
          final post = posts[index];
          final author = authors.firstWhere((a) => a.id == post.userId);

          return ListTile(
            title: Text(post.title!),
            subtitle: Text('Author: ${author.name}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailsScreen(post: post, author: author),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

