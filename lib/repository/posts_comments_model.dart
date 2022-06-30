

class PostsCommentsModel {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;
  PostsCommentsModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  PostsCommentsModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return PostsCommentsModel(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  factory PostsCommentsModel.fromJson(Map<String, dynamic> json) {
    return PostsCommentsModel(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body']);
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'postId': postId,
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'body': body,
  //   };
  // }

  // factory PostsCommentsModel.fromMap(Map<String, dynamic> map) {
  //   return PostsCommentsModel(
  //     postId: map['postId']?.toInt() ?? 0,
  //     id: map['id']?.toInt() ?? 0,
  //     name: map['name'] ?? '',
  //     email: map['email'] ?? '',
  //     body: map['body'] ?? '',
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory PostsCommentsModel.fromJson(String source) => PostsCommentsModel.fromMap(json.decode(source));

  // @override
  // String toString() {
  //   return 'PostsCommentsModel(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  // }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  
  //   return other is PostsCommentsModel &&
  //     other.postId == postId &&
  //     other.id == id &&
  //     other.name == name &&
  //     other.email == email &&
  //     other.body == body;
  // }

  // @override
  // int get hashCode {
  //   return postId.hashCode ^
  //     id.hashCode ^
  //     name.hashCode ^
  //     email.hashCode ^
  //     body.hashCode;
  // }
}