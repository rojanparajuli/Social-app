import 'package:chatapp/screen/home/home_screen.dart';
import 'package:chatapp/screen/login/sign-up/login_dialog.dart';
import 'package:chatapp/screen/login/sign-up/signup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Date Set Go'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/new logo.png'),
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(()=> SignupPage());
                },
                child: const Text('Sign Up'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(()=> LoginDialog());
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





