import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'myHomePage.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simply Chat')),
      body: Body()
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  FirebaseUser user;
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click() {
    signInWithGoogle().then((user) => {
          this.user = user,
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomePage(user)))
        });
  }
  Widget googleLoginButton(){
    // ignore: deprecated_member_use
    return OutlineButton(
      onPressed: this.click,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      splashColor: Colors.white,
      borderSide: BorderSide(color: Colors.white),
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/google_logo.png'), height: 45,alignment: Alignment.center,),
            Padding(padding: EdgeInsets.only(top: 20), child: Text('Sign in with Google',style: TextStyle(color: Colors.white, fontSize: 22),))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      //alignment: Alignment.center, 
      floatingActionButton: googleLoginButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/image1.jpg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black54,
        ),]
      )
    );
  }
}




