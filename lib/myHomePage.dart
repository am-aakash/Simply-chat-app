import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'database.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';


class MyHomePage extends StatefulWidget {
  final FirebaseUser user;

  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    post.setId(savePost(post));
    this.setState(() {
      posts.add(post);
    });
  }

  void updatePosts() {
    getAllPosts().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updatePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(title: Text('Simply Chat')),
        body: Column(children: <Widget>[
          Expanded(child: PostList(this.posts, widget.user)),
          TextInputWidget(this.newPost)
        ])


        // body: Column(children: <Widget>[
        //   Expanded(PostList(this.posts, widget.user)),
        //   TextInputWidget(this.newPost),
          // new Image(
          //   image: new AssetImage("assets/image1.jpg"),
          //   fit: BoxFit.fill,
          //    colorBlendMode: BlendMode.darken,
          //    color: Colors.grey,),
          
        // ]
        // )
          //TextInputWidget(this.newPost)
        );
        
    
  }
}
