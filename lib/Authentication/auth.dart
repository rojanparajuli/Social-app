import 'package:chatapp/screen/home/home_screen.dart';
import 'package:chatapp/service/save_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService extends GetxController {
    static const String isLoggedInKey = 'isLoggedIn';
  static const String userEmailKey = 'userEmail';
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
 final TextEditingController nameController =TextEditingController();
  final TextEditingController emailController  =TextEditingController();
  final TextEditingController confirmPassController =TextEditingController();
  final TextEditingController passwordController  =TextEditingController();
   final Savinglogin savinglogin = Get.put(Savinglogin());
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
      savinglogin.saveLogin();
      Get.to(()=> HomePage());
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
      print(e);

    } finally {
      Get.snackbar('Success', 'Created');
     Navigator.pop(Get.context!);
    }
    return null;
  }

  //sign out user
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }









  //   Future<User?> signInWithGoogle({required BuildContext context}) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;

  //   if (kIsWeb) {
  //     GoogleAuthProvider authProvider = GoogleAuthProvider();

  //     try {
  //       final UserCredential userCredential =
  //           await auth.signInWithPopup(authProvider);

  //       user = userCredential.user;
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     final GoogleSignIn googleSignIn = GoogleSignIn();

  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();

  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;

  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );

  //       try {
  //         final UserCredential userCredential =
  //             await auth.signInWithCredential(credential);

  //         user = userCredential.user;
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'account-exists-with-different-credential') {
  //           // ...
  //         } else if (e.code == 'invalid-credential') {
  //           // ...
  //         }
  //       } catch (e) {
  //         // ...
  //       }
  //     }
  //   }

  //   return user;
  // }





  Future<void> signInWithGoogle() async {
        FirebaseAuth auth = FirebaseAuth.instance;
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

         final UserCredential userCredential =
              await auth.signInWithCredential(credential);
    } else {
      // User canceled sign-in.
    }
  } catch (error) {
    print('Google Sign-In errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr: $error');
  }
}
}

