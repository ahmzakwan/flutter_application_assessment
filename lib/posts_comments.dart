import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_application_assessment/repository/posts_api.dart';
import 'package:flutter_application_assessment/repository/posts_comments_model.dart';

class PostsComments extends StatefulWidget {
  // final PostsCommentsModel? postsCommentsModel;
  final int? id;

  const PostsComments({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<PostsComments> createState() => _PostsCommentsState();
}

class _PostsCommentsState extends State<PostsComments> {
  // late Timer debouncer;
  final postsCommentsModel = PostsCommentsModel();
  final postApi = PostsApi();
  List<PostsCommentsModel> comments = [];
  List<PostsCommentsModel> filteredComments = [];
  // final _searchFilterResult = [];
  late Future<List<PostsCommentsModel>> postsCommentsLists;
  List<PostsCommentsModel> postsCommentsTry = [];
  String query = '';
  @override
  void initState() {
    // postsCommentsLists = postApi.getPostsComments(widget.id!);
    postApi.getPostsComments(widget.id!).then((commentsFromServer) {
      setState(() {
        comments = commentsFromServer;
        filteredComments = comments;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts Comments'),
        ),
        body:
            // FutureBuilder<List<PostsCommentsModel>>(
            //   future: postsCommentsLists,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       List<PostsCommentsModel> data = snapshot.data!;
            //       return
            Column(children: [
          TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Filter by name or email',
            ),
            onChanged: (string) {
              Timer.run(() {
                setState(() {
                  filteredComments = comments
                      .where((u) => (u.name!
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          u.email!
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredComments.length,
                  itemBuilder: (BuildContext context, int index) {
                    // final comment = data[index];
                    // return buildComments(comment);
                    return Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 5, right: 5),
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0,
                                    left: 8.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: ExpansionTile(
                                  title: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 72,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                filteredComments[index].name ??
                                                    '',
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  filteredComments[index]
                                                          .email ??
                                                      '',
                                                  maxLines: 1),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    Text(filteredComments[index].body ?? '',
                                        maxLines: 7)
                                  ],
                                ))));
                  }))
        ])
        //     } else if (snapshot.hasError) {
        //       return Text("${snapshot.error}");
        //     }
        //     // By default show a loading spinner.
        //     return const CircularProgressIndicator();
        //   },
        // ),
        );
  }
}
