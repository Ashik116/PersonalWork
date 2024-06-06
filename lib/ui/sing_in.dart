import 'package:dokan/ui/sign_up_screen.dart';
import 'package:dokan/widget/custom_icon_Button.dart';
import 'package:dokan/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/api_service.dart';

import 'home_page_screen.dart';

class SignINScreen extends StatefulWidget {
  const SignINScreen({super.key});

  @override
  State<SignINScreen> createState() => _SignINScreenState();
}

class _SignINScreenState extends State<SignINScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final SignInApiService apiService = SignInApiService();

  bool _loading = false;

  bool _obscureTextPassword = true;

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
                  SizedBox(
                    height: 54,
                  ),
                  Image.asset("assets/dokan.png"),
                  SizedBox(
                    height: 84,
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 59,
                  ),
                  ElevatedButton(
                    onPressed: _loading
                        ? null
                        : () async {
                            authenticate(context);
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
                        ? Container(
                            height: 15,
                            width: 15,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Text(
                            "Login",
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
                  GestureDetector(
                    child: Text(
                      "Create New Account",
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignUpScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> authenticate(BuildContext context) async {
    setState(() {
      _loading = true; // Show loading animation
    });
    try {
      print('Email: ${email.text}');
      print('Password: ${password.text}');

      final response =
          await apiService.authenticateUser(email.text, password.text);

      setState(() {
        _loading = false; // Hide loading animation
      });
      print('Authentication successful: $response');

      // Check if response code is 200
      if (response.isNotEmpty) {
        // Navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
        );
      }
    } catch (e) {
      setState(() {
        _loading = false; // Hide loading animation
      });
      print('Error: $e');
    }
  }
}
