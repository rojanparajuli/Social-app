import 'package:chatapp/screen/home/home_screen.dart';
import 'package:chatapp/screen/login/sign-up/password_reset_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({Key? key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter phone number and password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
              labelText: 'Phone number',
            ),
          ),
          const TextField(
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
                  Get.to(() => const HomePage());
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
