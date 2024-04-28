import 'package:chatapp/screen/login/sign-up/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sampleflutter/view/login/sign-up/login.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: "AIzaSyABk-F0t8Wobd8YGNac2yW_yv-ILfdOJnY",
   appId: "1:709544665512:android:d93945bbf15d36f4fa3d9d",
    messagingSenderId: "709544665512", 
    projectId:"chat-app-6b06b",));
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

