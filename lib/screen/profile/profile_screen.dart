import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // Handle edit button press
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.purple,
              padding: const EdgeInsets.all(20),
              height: 120,
            ),
             const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/prayash.jpg'),
                ),
              ),
            
            _buildProfileInfoCard(
              context,
              title: ' ',
              value: '''
                Name : ${firebaseAuth.currentUser!.displayName ?? ''}
                Email: ${firebaseAuth.currentUser!.email ?? ''}
                Gender: Male
                Age: 45
                Address: New York, USA
              ''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard(BuildContext context, {required String title, required String value}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
