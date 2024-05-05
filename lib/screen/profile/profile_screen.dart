import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../service/profile_service.dart';

class Profile extends StatelessWidget {
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = firebaseAuth.currentUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        backgroundColor: Color.fromARGB(249, 50, 218, 184),
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.10,
              color: Colors.transparent,
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/profileheader.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20),
              height: 120,
            ),
            Positioned(
              left: 50,
              top: 160,
              child: _buildProfileInfoCard(
               
                child:  StreamBuilder(stream: FirestoreServices.getUser(currentUser!.uid), 
                builder:(BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
                  var data = snapshot.data!.docs[0];
                  return            Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Container(child: Image.network(data['Bluetick']),),
            Text(
              "",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "kdjdj",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      );
                } )
                
    
              )
            ),
            Positioned(
              top: 42,
              left: MediaQuery.of(context).size.width / 2.7,
              child: const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/prayash.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard(
      { final child}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child:child
    );
  }
}
