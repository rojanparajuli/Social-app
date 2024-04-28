import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SignupPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter your details'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Full Name',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Mobile Number',
            ),
            keyboardType: TextInputType.phone,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email Address',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Date of Birth',
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
            Get.back();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}