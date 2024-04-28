import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/Authentication/auth.dart';

class SignupPage extends StatelessWidget {
  final AuthService authService = Get.put(AuthService());

   SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    void signUp() async {
      // Save a reference to ScaffoldMessengerState
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      try {
        await authService.signUpWithEmailAndPassword(
          authService.nameController.text,
          authService.emailController.text,
          authService.passwordController.text,
        );
        // Handle successful sign up
      } catch (e) {
        // Use the saved scaffoldMessenger to show SnackBar
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }

    return AlertDialog(
      title: const Text('Enter your details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: authService.nameController,
            decoration: const InputDecoration(
              labelText: 'Full Name',
            ),
          ),
          TextField(
            controller: authService.emailController,
            decoration: const InputDecoration(
              labelText: 'Email ',
            ),
            keyboardType: TextInputType.phone,
          ),
          TextField(
            controller: authService.passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: authService.confirmPassController,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
            keyboardType: TextInputType.datetime,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 30),
          ),
          onPressed: () {
            // Do something with the user input
            signUp();
            Get.back();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
