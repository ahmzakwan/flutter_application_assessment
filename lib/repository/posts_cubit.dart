
import 'package:flutter_application_assessment/repository/posts.dart';
import 'package:flutter_application_assessment/repository/posts_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<Posts>>{
  final _postsApi = PostsApi();
  PostsCubit() : super([]);

  void get posts async => emit(await _postsApi.fetchPosts());

}