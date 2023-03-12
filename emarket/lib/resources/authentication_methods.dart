import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emarket/Models/user_details_model.dart';
import 'package:emarket/resources/cloudfirestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();
  Future<String> signUpUser(
      {required String name,
      required String address,
      required String email,
      required String password,
      required String confirm_password}) async {
    name.trim();
    address.trim();
    email.trim();
    confirm_password.trim();
    password.trim();
    String output = "Something Went Wrong";
    if (name != "" &&
        email != "" &&
        address != "" &&
        password != "" &&
        confirm_password != "") {
      if (password == confirm_password) {
        try {
          await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password);
          UserDetailsModel user =
              UserDetailsModel(name: name, address: address);
          await cloudFirestoreClass.uploadNameAndAddressToDatabase(user: user);
          output = "Success";
        } on FirebaseAuthException catch (e) {
          output = e.message.toString();
        }
      } else {
        output = "Password Doesn't Match";
      }
    } else {
      output = "Please Fill Up Everything";
    }
    return output;
  }

  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    email.trim();
    password.trim();
    String output = "Something Went Wrong";
    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "Success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please Fill Up Everything";
    }
    return output;
  }
}
