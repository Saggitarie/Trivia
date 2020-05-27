import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "signin.dart";

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input){
                    if(input.isEmpty){
                      return "Please type an email";
                    }
                  },
                  onSaved: (input)=> _email = input,
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                ),
                TextFormField(
                  validator: (input){
                    if(input.isEmpty){
                      return "Please type an password";
                    }
                  },
                  onSaved: (input)=> _password = input,
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed: (){signIn();},
                  child: Text("Sign up"),
                )
              ],
            )
        )
    );
  }

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email.trim(), password: _password)).user;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SigninPage()));
      }catch(e) {
        print(e.message);
      }
    }
  }
}
