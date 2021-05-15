import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;
  final FirebaseUser user;

  PostList(this.listItems, this.user);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
              child: ListTile(
                //tileColor: Colors.black,
                title: Text(post.body, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
                subtitle: Text("from "+post.author, style: TextStyle(fontSize: 13)),
              )
            ),
            Row( children: <Widget>[
              Container(
                child: Text(post.usersLiked.length.toString()+" Likes",
                    style: TextStyle(fontSize: 16)),
                padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
              ),
              IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () => this.like(() => post.likePost(widget.user)),
                  color: post.usersLiked.contains(widget.user.uid)
                      ? Colors.blueAccent
                      : Colors.black)
            ],)
        ]));
      },
    );
  }
}
