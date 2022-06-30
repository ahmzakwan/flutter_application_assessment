import 'package:flutter/material.dart';
import 'package:flutter_application_assessment/posts_details.dart';
import 'package:flutter_application_assessment/repository/posts.dart';
import 'package:flutter_application_assessment/repository/posts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data'),
        ),
        body: BlocBuilder<PostsCubit, List<Posts>>(
          builder: (context, state) {
            if (state.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  Posts posts = state[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(posts.id.toString()),
                      ),
                      title: Text(posts.title ?? '', maxLines: 1),
                      subtitle: Text(posts.body ?? '', maxLines: 7),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostsDetails(posts:posts)));
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
