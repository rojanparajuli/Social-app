import 'package:chatapp/screen/chat/inbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';




class ChatInbox extends StatelessWidget {
   ChatInbox({super.key});
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
        actions: [
          IconButton(
            icon: const Icon(Icons.circle,color: Color.fromARGB(255, 1, 131, 5),),
            onPressed: () {
              //online button pressed
            },
          ),
          IconButton(
            icon: const Icon(Icons.search_sharp),
            onPressed: () {
              // search button pressed
            },
          ),
        ],
      ),
      body: Container(
      child: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(child: const Text('error'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(child: const Text("Loading..."));
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    )
      )
       
    );
  }
  //build individual user list items

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;


//display all users except current user
    if (firebaseAuth.currentUser!.email != data['email']) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Card(
          child: ListTile(
              title: Text(
                 data['name']??"hello",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
               
                data['email']??""
                ),
              onTap: () {
                Get.to(()=>ChatPage(
                   receiverUserName: data['name'],
                      receiverUserEmail: data['email'],
                      receiverID: data['uid'],
                ));
              }),
        ),
      );
    } else {
      return Container();
    }
  }
}
