import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_assessment/repository/posts.dart';
import 'package:flutter_application_assessment/repository/posts_comments_model.dart';
import 'package:http/http.dart' as http;

class PostsApi {
  Future<List<Posts>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List;
    final posts = json.map((e) => Posts.fromJson(e)).toList();
    debugPrint(posts.toString());
    return posts;
  } else {
    throw Exception('Failed to load posts');
  }
}

Future<List<PostsCommentsModel>> getPostsComments(int id) async{
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$id'));

      if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List;
    final postsCommentsModel = json.map((e) => PostsCommentsModel.fromJson(e)).toList();
    debugPrint(postsCommentsModel.toString());
    return postsCommentsModel;
  } else {
    throw Exception('Failed to load posts comments');
  }
}
}