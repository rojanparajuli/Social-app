import 'package:chatapp/screen/home/home_screen.dart';
import 'package:chatapp/screen/login/sign-up/password_reset_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginDialog extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
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
              Get.to(()=> const ResetPasswordPage());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(()=> const HomePage());
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Logged in successfully! Welcome.',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green, // Snackbar background color
                      duration: Duration(seconds: 3), // Snackbar display duration
                    ),
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