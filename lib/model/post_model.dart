class Post {
  final int id;
  final String title;
  final String body;
  final Map<String, dynamic> author;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.author,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      author: json['author'],
    );
  }
}
