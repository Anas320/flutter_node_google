import 'package:flutter/material.dart';
import 'package:google_signin_example/widget/background_painter.dart';
import 'package:google_signin_example/widget/google_signup_button_widget.dart';
import './../page//Signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  String email;
  String password;

  @override

  // Widget build(BuildContext context) => Stack(
  //       fit: StackFit.expand,
  //       children: [
  //         CustomPaint(painter: BackgroundPainter()),
  //         buildSignUp(),
  //       ],
  //     );

  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (emails) {
                    email = emails;
                  },
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(height: 20.0),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      password = text;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  obscureText: true,
                ),
                SizedBox(height: 5.0),
                SizedBox(height: 40.0),
                GestureDetector(
                  onTap: () async {
                    var response =
                        await http.post('http://localhost:5000/', headers: {
                      // 'Content-Type': "application/json",
                      // 'Authorization': 'Bearer ' + await _token.getToken(),
                    }, body: {
                      "email": "ansss@gmail.com",
                      "password": "broksfomUS123@sss"
                    }).then((value) => print(value));
                    // var headers = {'Content-Type': 'application/json'};
                    // var request = http.Request(
                    //     'POST', Uri.parse('http://localhost:5000/auth/login'));
                    // request.body =
                    //     json.encode({"email": email, "password": password});
                    // request.headers.addAll(headers);

                    // http.StreamedResponse response = await request.send();

                    // if (response.statusCode == 200) {
                    //   print(await response.stream.bytesToString());
                    // } else {
                    //   print(response.reasonPhrase);
                    // }
                  },
                  child: Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //     color: Colors.black,
                        //     style: BorderStyle.solid,
                        //     width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GoogleSignupButtonWidget(),
                        // SizedBox(width: 10.0),

                        // Center(
                        //   child: Text('Log in with facebook',
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontFamily: 'Montserrat')),
                        // )
                      ],
                    ),
                  ),
                )
              ],
            )),
        SizedBox(height: 15.0),
      ],
    ));
  }

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'Welcome Back To MyApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          GoogleSignupButtonWidget(),
          SizedBox(height: 12),
          Text(
            'Login to continue',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
        ],
      );
}
