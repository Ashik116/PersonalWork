import 'dart:convert';

import 'package:dokan/ui/sing_in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widget/custom_icon_Button.dart';
import '../widget/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _loading = false;

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _globalKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 58),
              child: Column(
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 5,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    100), // Match the Card's shape
                              ),
                              child: Container(
                                width: 121.53,
                                height: 121.53,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/person.png",
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 5,
                                child: Container(
                                  height: 34.11,
                                  width: 34.11,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFF75F55),
                                  ),
                                  child: Image.asset("assets/camera.png"),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  Card(
                    elevation: 5,
                    shadowColor: Colors.black,
                    child: CustomTexFormField(
                      fillColor: Colors.white,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(23, 20, 16, 20),
                        child: Image.asset(
                          "assets/name.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      controller: name,
                      hintText: "Name",
                      textInputType: TextInputType.name,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Card(
                    elevation: 5,
                    shadowColor: Colors.black,
                    child: CustomTexFormField(
                      fillColor: Colors.white,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(23, 20, 16, 20),
                        child: Image.asset(
                          "assets/eml.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      controller: email,
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Card(
                    elevation: 5,
                    shadowColor: Colors.black,
                    child: CustomTexFormField(
                      fillColor: Colors.white,
                      controller: password,
                      hintText: "Password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextPassword = !_obscureTextPassword;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Image.asset(
                            "assets/eye.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(maxHeight: 2),
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(23, 20, 16, 20),
                        child: Image.asset(
                          "assets/pass.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 61,
                      ),
                      obscureText: _obscureTextPassword,
                      contentPadding: EdgeInsets.symmetric(vertical: 19),
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Card(
                    elevation: 5,
                    shadowColor: Colors.black,
                    child: CustomTexFormField(
                      fillColor: Colors.white,
                      controller: confirmpassword,
                      hintText: "Confirm Password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextConfirmPassword =
                                !_obscureTextConfirmPassword;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Image.asset(
                            "assets/eye.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(maxHeight: 2),
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(23, 20, 16, 20),
                        child: Image.asset(
                          "assets/pass.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 61,
                      ),
                      obscureText: _obscureTextConfirmPassword,
                      contentPadding: EdgeInsets.symmetric(vertical: 19),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: _loading
                        ? null
                        : () async {
                            if (_globalKey.currentState!.validate()) {
                              setState(() {
                                _loading = true;
                              });
                              await registerUser(
                                  name.text, email.text, password.text);
                              setState(() {
                                _loading = false;
                              });
                            }
                          },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(double.infinity, 50)), // Change the height here
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Set the radius to 0 for a rectangular button
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFFF75F55),
                      ), // Change the color here
                    ),
                    child: _loading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 2.0,
                            ),
                          )
                        : Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        height: 56,
                        width: 56,
                        child: Image.asset(
                          "assets/fb.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: CustomIconButton(
                          height: 56,
                          width: 56,
                          child: Image.asset(
                            'assets/google.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 52,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignINScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account?",
                        ),
                        Text(
                          "  Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser(String name, String email, String password) async {
    final url = 'http://apptest.dokandemo.com/wp-json/wp/v2/users/register';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Registration successful
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignINScreen()),
      );
    } else if (response.statusCode == 301 || response.statusCode == 302) {
      // Handle redirection
      final redirectedUrl = response.headers['location'];
      if (redirectedUrl != null) {
        final newResponse = await http.post(
          Uri.parse(redirectedUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'username': name,
            'email': email,
            'password': password,
          }),
        );

        if (newResponse.statusCode == 200) {
          // Registration successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignINScreen()),
          );
        } else {
          // Registration failed
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Failed to register user: ${newResponse.statusCode}')),
          );
          print('Response body: ${newResponse.body}');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Redirection failed without a location')),
        );
      }
    } else {
      // Registration failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to register user: ${response.statusCode}')),
      );
      print('Response body: ${response.body}');
    }
  }
}
