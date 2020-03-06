import 'package:flutter/material.dart';

class LoginSignupPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();

}
String _email;
String _password;
bool _isLoading;
var _isLoginForm;

class _LoginSignupPageState extends State<LoginSignupPage>{

 @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter login demo'),
        ),
        body: Stack(
          children: <Widget>[
           // showForm(),
            showCircularProgress(),
          ],
        ));
  }

}

Widget showCircularProgress() {
    
        if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('image/logoLogin.png'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
          child: new TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: new InputDecoration(
                hintText: 'Email',
                icon: new Icon(
                  Icons.mail,
                  color: Colors.grey,
                )),
            validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
            onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: new TextFormField(
            maxLines: 1,
            obscureText: true,
            autofocus: false,
            decoration: new InputDecoration(
                hintText: 'Password',
                icon: new Icon(
                  Icons.lock,
                  color: Colors.grey,
                )),
            validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
            onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    
        return new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
            child: SizedBox(
              height: 40.0,
              child: new RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.blue,
                child: new Text(_isLoginForm ? 'Login' : 'Create account',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
           // onPressed: validateAndSubmit,
          ),
        ));
  }