import 'package:flutter/material.dart';
import 'package:flutter_webdesign/services/auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Travello',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 1.0),
        ),
      ),
      body: Center(
        child: Container(
            height: 250.0,
            width: 300.0,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              )
            ]), //
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Text('Sign Up',
                    style: TextStyle(
                        color: Colors.blue.withOpacity(0.7),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0)),
                Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                                top: 20.0,
                                bottom: 5.0),
                            child: Container(
                              height: 50.0,
                              child: TextFormField(
                                decoration: InputDecoration(hintText: 'Email'),
                                validator: (value) => value!.isEmpty
                                    ? 'Email is required'
                                    : validateEmail(value.trim()),
                                onChanged: (value) {
                                  this.email = value;
                                },
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                                top: 20.0,
                                bottom: 5.0),
                            child: Container(
                              height: 50.0,
                              child: TextFormField(
                                obscureText: true,
                                decoration:
                                    InputDecoration(hintText: 'Password'),
                                validator: (value) => value!.isEmpty
                                    ? 'Password is required'
                                    : null,
                                onChanged: (value) {
                                  this.password = value;
                                },
                              ),
                            )),
                        SizedBox(height: 20),

                        InkWell(
                            onTap: () {
                              if (checkFields()) {
                                AuthService().signUp(email, password);
                              }
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: 40.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                ),
                                child: Center(child: Text('Sign Up')))),

                        //Sign up
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
