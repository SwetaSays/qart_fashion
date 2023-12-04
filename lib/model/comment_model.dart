class Comment {
  final String name;
  final String body;

  Comment({required this.name, required this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      name: json['name'],
      body: json['body'],
    );
  }
}