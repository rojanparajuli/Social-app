import 'package:chatapp/screen/home/home_screen.dart';
import 'package:chatapp/service/save_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/Authentication/auth.dart';
import 'package:chatapp/constant/colors.dart';
import 'package:chatapp/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthService authService = Get.put(AuthService());
  final Logincontroller _logincontroller = Get.put(Logincontroller());
  final Savinglogin savinglogin = Get.put(Savinglogin());

  // ignore: use_key_in_widget_constructors
  LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: savinglogin.isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final bool isLoggedIn = snapshot.data ?? false;
          if (isLoggedIn) {
            return const HomePage();
          } else {
            // ignore: deprecated_member_use
            return WillPopScope(
              onWillPop: () async {
                bool exit = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Exit App?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    content: const Text(
                      'Are you sure you want to exit the app?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    actions: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'No',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                      ),
                    ],
                  ),
                );
                return exit;
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: const Center(child: Text('Login')),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/new logo.png'),
                        TextFormField(
                          controller: authService.emailController,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => TextFormField(
                            controller: authService.passwordController,
                            obscureText: _logincontroller.obscureText.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(_logincontroller.obscureText.value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  _logincontroller.obscureText.value =
                                      !_logincontroller.obscureText.value;
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(purple3),
                          ),
                          onPressed: () async {
                            try {
                              await authService.signInWithEmailAndPassword();
                              Get.snackbar(
                                'Success',
                                'Logged in successfully! Welcome.',
                                colorText: Colors.black,
                                duration: const Duration(seconds: 3),
                              );
                            } catch (e) {
                              Get.snackbar(
                                'Error',
                                e.toString(),
                                colorText: Colors.black,
                                duration: const Duration(seconds: 3),
                              );
                            }
                          },
                          child: const Text('Submit',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            authService.signInWithGoogle();
                          },
                          child: const Text('Google Sign in'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
