import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100], // Set background color
      body: const Center(
        child:  Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.chat_bubble,
                size: 50,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to Our App!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: 'Pacifico', // Custom font
                ),
              ),
              SizedBox(height: 20),
              Text(
                'We are currently undergoing maintenance to improve your experience.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'During this time, only chat services are available.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Our mission is to connect people and facilitate communication.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'We believe that by enabling easy and convenient communication, we can bring people closer together, foster relationships, and create a stronger sense of community.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
