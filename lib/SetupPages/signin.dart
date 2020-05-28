import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:quiz_polyglottal/QuizPages/quizepage.dart';
import 'package:quiz_polyglottal/SetupPages/start.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please type an email";
                    }
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Please type an password";
                    }
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed: () {
                    signIn();
                  },
                  child: Text("Sign in"),
                )
              ],
            )));
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _email.trim(), password: _password))
            .user;

        //TODO Navigate to home
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StartPage(),
          ),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }
}
