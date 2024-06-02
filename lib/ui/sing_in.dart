import 'package:dokan/widget/custom_elevated_button.dart';
import 'package:dokan/widget/custom_icon_Button.dart';
import 'package:dokan/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignINScreen extends StatefulWidget {
  const SignINScreen({super.key});

  @override
  State<SignINScreen> createState() => _SignINScreenState();
}

class _SignINScreenState extends State<SignINScreen> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
              padding: EdgeInsets.symmetric(horizontal: 32,vertical: 58),
              child: Column(
                children: [
                  SizedBox(height: 84,),
                  Image.asset("assets/dokan.png"),
                  SizedBox(height: 84,),
                  Text("Sign IN",style: TextStyle(
                    fontSize: 25,fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 38,),
                  CustomTexFormField(
                    fillColor: Colors.grey,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(23,20,16,20),
                      child: Image.asset("assets/eml.png",height: 20,width: 20,),
                    ),
                    controller: email,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 30,vertical: 20,
                    ),
                  ),
                  SizedBox(height: 19,),
                  CustomTexFormField(
                    fillColor: Colors.grey,
                    controller: password,
                    hintText: "Password",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(23,20,16,20),
                      child: Image.asset("assets/pass.png",height: 20,width: 20,),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: 61,
                    ),

                    obscureText: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 19),
                  ),
                  SizedBox(height: 18,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Forget Password?",style: TextStyle(
                      fontSize: 13,
                    ),),
                  ),
                  SizedBox(height: 59,),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Color(0xFFF75F55),
                  //     padding: EdgeInsets.only(left: 10,right: 10),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10), // Set the radius to 0 for a rectangular button
                  //     ),
                  //     minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                  //   ),
                  //   onPressed: (){},
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       //leftIcon??SizedBox.shrink(),
                  //       Text("Login1",style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 20,
                  //       ),),
                  //      // rightIcon ?? SizedBox.shrink(),
                  //     ],
                  //   ),
                  // ),


                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)), // Change the height here
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Set the radius to 0 for a rectangular button
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Color(0xFFF75F55),), // Change the color here
                    ),
                    child: Text("Login",style: TextStyle(
                      color: Colors.black,fontSize: 20,
                    ),),
                    ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        height: 56,width: 56,padding: EdgeInsets.all(16),
                        child: Image.asset("assets/fb.png"),
                      ),
                      Padding(padding: EdgeInsets.only(left: 14),
                      child: CustomIconButton(
                          height: 56,width: 56,
                          child: Padding(
                            padding:  EdgeInsets.all(1.0),
                            child: Image.asset('assets/google.png'),
                          )),
                      ),
                    ],
                  ),
                  SizedBox(height: 52,),
                  Text("Create New Account",),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
