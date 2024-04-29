import 'package:chatapp/screen/home/home_screen.dart';
import 'package:chatapp/screen/login/sign-up/password_reset_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Authentication/auth.dart';

class LoginDialog extends StatelessWidget {
   LoginDialog({Key? key});

 final AuthService authService = Get.put(AuthService());
  @override
  Widget build(BuildContext context) {
    // void Login() async {
    //   // Save a reference to ScaffoldMessengerState
    //   final scaffoldMessenger = ScaffoldMessenger.of(context);

    //   try {
    //     await authService.signInWithEmailAndPassword(
    //     a  emailController.text,
         
    //       passwordController.text
    //     );
    //     // Handle successful sign up
    //   } catch (e) {
    //     // Use the saved scaffoldMessenger to show SnackBar
    //     scaffoldMessenger.showSnackBar(
    //       SnackBar(
    //         content: Text(e.toString()),
    //       ),
    //     );
    //   }
    // }
    return AlertDialog(
      title: const Text('Enter phone number and password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           TextField(
            controller:authService.emailController,
            decoration: InputDecoration(
              labelText: 'email',
            ),
          ),
           TextField(
            controller: authService.passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          TextButton(
            child: const Text(
              "Forget Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Get.to(() => const ResetPasswordPage());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                 authService.signInWithEmailAndPassword();
                  Get.snackbar(
                    'Success',
                    'Logged in successfully! Welcome.',
                    // backgroundColor: Colors.green,
                    colorText: Colors.black,
                    duration: const Duration(seconds: 3),
                  );
                },
                child: const Text('Submit'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
