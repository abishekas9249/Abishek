import 'dart:developer';

import 'package:emarket/Screens/sign_in_screen.dart';
import 'package:emarket/resources/authentication_methods.dart';
import 'package:emarket/utils/utils.dart';
import 'package:flutter/material.dart';

import '../Widgets/custom_main_button.dart';
import '../Widgets/text_field_widget.dart';
import '../utils/color_themes.dart';
import '../utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    addressController.dispose();
    confirmpasswordController.dispose();
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
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width * 1,
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
                              "Sign-Up",
                              style: TextStyle(
                                  fontSize: 33, fontWeight: FontWeight.w500),
                            ),
                            TextFieldWidget(
                              title: "Name",
                              controller: nameController,
                              obsureText: false,
                              hintText: "Enter your Name",
                            ),
                            TextFieldWidget(
                              title: "Address",
                              controller: addressController,
                              obsureText: false,
                              hintText: "Enter your Address",
                            ),
                            TextFieldWidget(
                              title: "Email",
                              controller: emailController,
                              obsureText: false,
                              hintText: "Enter your Email",
                            ),
                            TextFieldWidget(
                              title: "Password",
                              controller: passwordController,
                              obsureText: true,
                              hintText: "Enter your Password",
                            ),
                            TextFieldWidget(
                              title: " Confirm Password",
                              controller: confirmpasswordController,
                              obsureText: true,
                              hintText: "Enter your Password",
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomMainButton(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        letterSpacing: 0.8,
                                        color: Colors.black),
                                  ),
                                  color: yellowColor,
                                  isLoading: isLoading,
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Future.delayed(Duration(seconds: 1));
                                    String output =
                                        await authenticationMethods.signUpUser(
                                            name: nameController.text,
                                            address: addressController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            confirm_password:
                                                confirmpasswordController.text);
                                    setState(() {
                                      isLoading = false;
                                    });
                                    if (output == "Success") {
                                      Utils().showSnackBar(
                                          context: context,
                                          content: "Authentication Success");
                                    } else {
                                      Utils().showSnackBar(
                                          context: context, content: output);
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomMainButton(
                      child: Text(
                        "Back",
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
                          return SignInScreen();
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
