import 'package:chatapp/controller/sign-up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/Authentication/auth.dart';

class SignupPage extends StatelessWidget {
  final AuthService authService = Get.put(AuthService());
  final Signupcontroller signupcontroller = Get.put(Signupcontroller());

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    // void signUp() async {
    //   // Save a reference to ScaffoldMessengerState
    //   final scaffoldMessenger = ScaffoldMessenger.of(context);

    //   // try {
    //     await authService.signUpWithEmailAndPassword(
    //       nameController.text,
    //       emailController.text,
    //       passwordController.text,
    //     );
    //     print("😒");
    //     print(emailController.text);
    //     // Handle successful sign up
    //   // } catch (e) {
    //   //   // Use the saved scaffoldMessenger to show SnackBar
    //   //   scaffoldMessenger.showSnackBar(
    //   //     SnackBar(
    //   //       content: Text(e.toString()),
    //   //     ),
    //   //   );
    //   // }
    // }

    return AlertDialog(
      title: const Text('Enter your details'),
      content: Obx(
        () => Column(
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
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              obscureText: signupcontroller.obscureText.value,
              controller: authService.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(signupcontroller.obscureText.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    signupcontroller.obscureText.value =
                        !signupcontroller.obscureText.value;
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            TextField(
              obscureText: signupcontroller.obscureText.value,
              controller: authService.confirmPassController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                suffixIcon: IconButton(
                  icon: Icon(signupcontroller.obscureText.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    signupcontroller.obscureText.value =
                        !signupcontroller.obscureText.value;
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ],
        ),
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
            authService.signUpWithEmailAndPassword();
            //Get.back();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
