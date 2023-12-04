// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Blog App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: PostListScreen(),
//     );
//   }
// }
//
// class PostListScreen extends StatefulWidget {
//   @override
//   _PostListScreenState createState() => _PostListScreenState();
// }
//
// class _PostListScreenState extends State<PostListScreen> {
//   List<Post> posts = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchPosts();
//   }
//
//   Future<void> fetchPosts() async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if (response.statusCode == 200) {
//       setState(() {
//         posts = (json.decode(response.body) as List).map((data) => Post.fromJson(data)).toList();
//       });
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posts'),
//       ),
//       body: ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(posts[index].title),
//             subtitle: Text(posts[index].authorName),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PostDetailsScreen(post: posts[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class PostDetailsScreen extends StatefulWidget {
//   final Post post;
//
//   const PostDetailsScreen({required this.post});
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
//         title: Text('Post Details'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.post.title,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Author: ${widget.post.authorName}',
//               style: TextStyle(fontSize: 16),
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
//
// class Post {
//   final int id;
//   final String title;
//   final String authorName;
//
//   Post({required this.id, required this.title, required this.authorName});
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       authorName: 'Unknown', // Author name is not provided in the posts API, modify this according to your requirements.
//     );
//   }
// }
//
// class Comment {
//   final String name;
//   final String body;
//
//   Comment({required this.name, required this.body});
//
//   factory Comment.fromJson(Map<String, dynamic> json) {
//     return Comment(
//       name: json['name'],
//       body: json['body'],
//     );
//   }
// }


/////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Blog App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: PostListScreen(),
//     );
//   }
// }
//
// class Author {
//   final int id;
//   final String name;
//   final String username;
//   final String email;
//   final String phone;
//   final String website;
//
//   Author({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.phone,
//     required this.website,
//   });
//
//   factory Author.fromJson(Map<String, dynamic> json) {
//     return Author(
//       id: json['id'],
//       name: json['name'],
//       username: json['username'],
//       email: json['email'],
//       phone: json['phone'],
//       website: json['website'],
//     );
//   }
// }
//
// class Post {
//   final int id;
//   final String title;
//   final Author author;
//
//   Post({
//     required this.id,
//     required this.title,
//     required this.author,
//   });
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       author: Author.fromJson(json), // Use the Author.fromJson method to parse author details
//     );
//   }
// }
//
// class Comment {
//   final String name;
//   final String body;
//
//   Comment({required this.name, required this.body});
//
//   factory Comment.fromJson(Map<String, dynamic> json) {
//     return Comment(
//       name: json['name'],
//       body: json['body'],
//     );
//   }
// }
//
// class PostListScreen extends StatefulWidget {
//   @override
//   _PostListScreenState createState() => _PostListScreenState();
// }
//
// class _PostListScreenState extends State<PostListScreen> {
//   List<Post> posts = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchPosts();
//   }
//
//   Future<void> fetchPosts() async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if (response.statusCode == 200) {
//       final List<dynamic> postsJson = json.decode(response.body);
//       List<Post> postsList = [];
//
//       for (var postData in postsJson) {
//         // Fetch author details for each post
//         final authorResponse = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/${postData["userId"]}'));
//         if (authorResponse.statusCode == 200) {
//           final Author author = Author.fromJson(json.decode(authorResponse.body));
//           final Post post = Post.fromJson(postData)..author = author;
//           postsList.add(post);
//         }
//       }
//
//       setState(() {
//         posts = postsList;
//       });
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posts'),
//       ),
//       body: ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(posts[index].title),
//             subtitle: Text('Author: ${posts[index].author.name}'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PostDetailsScreen(post: posts[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class PostDetailsScreen extends StatefulWidget {
//   final Post post;
//
//   const PostDetailsScreen({required this.post});
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
//         title: Text('Post Details'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.post.title,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Author: ${widget.post.author.name}',
//               style: TextStyle(fontSize: 16),
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

// ignore_for_file: depend_on_referenced_packages

///////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:qart_fashion/view/post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Blog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostListScreen(),
    );
  }
}

