import 'package:chatapp/screen/error/access_denied.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPageBody extends StatelessWidget {
  const AboutPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text('About '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to ChatApp!',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'At ChatApp, we believe in the power of meaningful connections. '
              'In a world where technology often separates us, we strive to bring people closer together through seamless communication and shared experiences.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Our mission is simple: to connect people from all walks of life, across the globe. '
              'Whether you\'re looking to make new friends, find a mentor, network professionally, or simply engage in lively conversations, ChatApp provides the platform to do so effortlessly.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'How We Connect People',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const ListTile(
              leading: Icon(Icons.smartphone, size: 40.0, color: Colors.blue),
              title: Text(
                'User-Friendly Interface',
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                'Our app is designed with user experience in mind, ensuring that connecting with others is intuitive and enjoyable.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
               Get.to(()=>const AccessDeniedPage());
              },
              child: const Text(
                'Join the ChatApp Community',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
