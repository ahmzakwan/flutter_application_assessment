
import 'package:flutter/material.dart';
import 'package:flutter_application_assessment/repository/posts.dart';
import 'package:flutter_application_assessment/posts_comments.dart';

class PostsDetails extends StatelessWidget{
  final Posts? posts;

  const PostsDetails({Key? key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// final PostsCommentsModel postsCommentsModel;
    return Scaffold(
      appBar: AppBar(title: const Text('Posts Details'),),
      body:  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(posts!.id.toString()),
                      ),
                      title: Text(posts!.title ?? '', maxLines: 1),
                      subtitle: Text(posts!.body ?? '', maxLines: 7),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostsComments(id: posts!.id)));
                        // Navigator.pushNamed(context, RouteGenerator.commentsPage,arguments:{"postId":posts.userId});
                      },
                    ),),
    );
  }

}