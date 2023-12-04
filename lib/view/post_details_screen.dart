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

  const PostDetailsScreen({required this.post, required this.author});

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
        title: Text('Post Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Author: ${author.name}'),
            SizedBox(height: 16),
            Text(post.body!),
            SizedBox(height: 16),
            Text(
              'Comments:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FutureBuilder<List<Comment>>(
              future: fetchComments(post.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
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

// class PostDetailsScreen extends StatefulWidget {
//   final Post post;
//
//   const PostDetailsScreen({super.key, required this.post});
//
//   @override
//   _PostDetailsScreenState createState() => _PostDetailsScreenState();
// }
//
// class _PostDetailsScreenState extends State<PostDetailsScreen> {
//   List<Comment> comments = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchComments();
//   }
//
//   Future<void> fetchComments() async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${widget.post.id}/comments'));
//     if (response.statusCode == 200) {
//       setState(() {
//         comments = (json.decode(response.body) as List).map((data) => Comment.fromJson(data)).toList();
//       });
//     } else {
//       throw Exception('Failed to load comments');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Post Details'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.post.title,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.post.body, // Display post body
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Author: ${widget.post.author["name"]}',
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: comments.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(comments[index].name),
//                   subtitle: Text(comments[index].body),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
