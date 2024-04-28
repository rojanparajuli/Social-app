import 'package:chatapp/screen/login/sign-up/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sampleflutter/view/login/sign-up/login.dart';

Color myColor = const Color(0xFF123456);
void main(){
  return runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loding...',
       theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      
      home: const LoginPage()
    );
  }
}

