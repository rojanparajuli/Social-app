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
              child: const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/prayash.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileInfoCard(
              context,
              title: 'Email',
              value: firebaseAuth.currentUser!.email ?? '',
            ),
            _buildProfileInfoCard(
              context,
              title: 'Gender',
              value: 'Male',
            ),
            _buildProfileInfoCard(
              context,
              title: 'Age',
              value: '45',
            ),
            _buildProfileInfoCard(
              context,
              title: 'Address',
              value: 'New York, USA',
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'User Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Email: ${firebaseAuth.currentUser!.email ?? ''}'),
                          const SizedBox(height: 10),
                          const Text('Gender: Male'),
                          const SizedBox(height: 10),
                          const Text('Age: 45'),
                          const SizedBox(height: 10),
                          const Text('Address: New York, USA'),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Show Details'),
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
