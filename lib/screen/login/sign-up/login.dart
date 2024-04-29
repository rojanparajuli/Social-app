import 'package:chatapp/Authentication/auth.dart';
import 'package:chatapp/constant/colors.dart';
import 'package:chatapp/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
    final AuthService authService = Get.put(AuthService());
    final Logincontroller _logincontroller = Get.put(Logincontroller());
   LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                decoration:  InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                 
                ),
              ),
              const SizedBox(height: 20), 
              Obx(
                () => TextFormField(
                  controller: authService.passwordController,
                  obscureText: _logincontroller.obscureText.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
                  backgroundColor: MaterialStateProperty.all<Color>(purple3),
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
                child: const Text('Submit', style: TextStyle(fontSize: 18, color: Colors.white)), 
              ),
              const SizedBox(height: 30,),
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
    );
  }
}





