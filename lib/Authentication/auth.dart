import 'package:chatapp/screen/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
 final TextEditingController nameController =TextEditingController();
  final TextEditingController emailController  =TextEditingController();
  final TextEditingController confirmPassController =TextEditingController();
  final TextEditingController passwordController  =TextEditingController();
  Future<UserCredential?> signInWithEmailAndPassword(
      ) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email':  emailController.text,
        'password':  passwordController.text
      }, SetOptions(merge: true));
      print("callleeeeeed😒");
      Get.to(()=>HomePage());
      return userCredential;
      
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      ) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email:  emailController.text,
        password: passwordController.text,
      );
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': emailController.text,
        'password': passwordController.text,
        'name': nameController.text
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out user
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
