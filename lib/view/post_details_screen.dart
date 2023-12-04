// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qart_fashion/model/author_model.dart';
import 'package:qart_fashion/model/comment_model.dart';
import 'package:qart_fashion/model/post_model.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;
  final Author author;

  const PostDetailsScreen({super.key, required this.post, required this.author});

  Future<List<Comment>> fetchComments(int postId) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List).map((data) => Comment.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Author: ${author.name}'),
            const SizedBox(height: 16),
            Text(post.body!),
            const SizedBox(height: 16),
            const Text(
              'Comments:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FutureBuilder<List<Comment>>(
              future: fetchComments(post.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Comment> comments = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: comments
                        .map((comment) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(comment.name!),
                        subtitle: Text(comment.body!),
                      ),
                    ))
                        .toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
