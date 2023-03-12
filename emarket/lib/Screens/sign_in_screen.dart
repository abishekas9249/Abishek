import 'dart:developer';

import 'package:emarket/Screens/sign_up_screen.dart';
import 'package:emarket/Widgets/custom_main_button.dart';
import 'package:emarket/Widgets/text_field_widget.dart';
import 'package:emarket/resources/authentication_methods.dart';
import 'package:emarket/utils/color_themes.dart';
import 'package:emarket/utils/constants.dart';
import 'package:emarket/utils/utils.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.1,
                  ),
                  Container(
                    height: screenSize.height * 0.6,
                    width: screenSize.width * 0.8,
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign-In",
                          style: TextStyle(
                              fontSize: 33, fontWeight: FontWeight.w500),
                        ),
                        TextFieldWidget(
                          title: "Email",
                          controller: emailcontroller,
                          obsureText: false,
                          hintText: "Enter your Email",
                        ),
                        TextFieldWidget(
                          title: "Password",
                          controller: passwordcontroller,
                          obsureText: true,
                          hintText: "Enter your Password",
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomMainButton(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    letterSpacing: 0.8, color: Colors.black),
                              ),
                              color: yellowColor,
                              isLoading: isLoading,
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                Future.delayed(Duration(seconds: 1));
                                String output =
                                    await authenticationMethods.signInUser(
                                        email: emailcontroller.text,
                                        password: passwordcontroller.text);
                                setState(() {
                                  isLoading = false;
                                });
                                if (output == "Success") {
                                  Utils().showSnackBar(
                                      context: context,
                                      content: "Sign In Successful");
                                } else {
                                  log(output);
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "New to Amazon ?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  CustomMainButton(
                      child: Text(
                        "Create an Amazon Account",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            letterSpacing: 0.8),
                      ),
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
