import "package:flutter/material.dart";
import "signin.dart";
import "signup.dart";

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Ilomonea")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              navigateToSignIn();
            },
            child: Text("Sign in"),
          ),
          RaisedButton(
            onPressed: () {
              navigateToSignUp();
            },
            child: Text("Sign up"),
          ),
        ],
      ),
    );
  }

  void navigateToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SigninPage(),
          fullscreenDialog: true
      ),
    );
  }

  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SignUpPage(),
          fullscreenDialog: true
      ),
    );
  }
}
