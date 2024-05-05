import 'package:chatapp/constant/chat_bubble.dart';
import 'package:chatapp/screen/profile/profile_screen.dart';
import 'package:chatapp/service/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverID;
  final String receiverUserName;
  final int unreadMessageCount;

  const ChatPage({
    super.key,
    required this.receiverUserEmail,
    required this.receiverID,
    required this.receiverUserName,
    required this.unreadMessageCount,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    // Step 2: Dispose the ScrollController
    _scrollController.dispose();
    super.dispose();
  }

  // Step 3: Add a method to scroll to the bottom
  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverID, _messageController.text);
    }
    _messageController.clear();
    // Scroll to the bottom after a new message is sent and UI updates
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  bool isMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: GestureDetector(

           onTap: () {
              Get.to(()=>Profile());
           },
            child: Text(
                    widget.receiverUserName,
                  ),
          )),
      body :
       Column(

        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: "Type a message...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 165, 91, 177),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 165, 91, 177),
                      ),
                    ),
                  ),
                )),
                IconButton(
                    onPressed: sendMessage,
                    icon: const Icon(
                      Icons.send,
                      color: Colors.deepPurple,
                      size: 30,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverID, _firebaseAuth.currentUser!.uid),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        if (!snapshot.hasData) {
          return const Text("No data");
        } else {}
        print("=============================");
        print(snapshot.data);
        print("Document Count: ${snapshot.data!.docs.length}");
        return ListView(
          controller: _scrollController,
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    DateTime myDateTime = DateTime.parse(data['timestamp'].toDate().toString());
    String formattedDateTime = DateFormat('h:mm a').format(myDateTime);
    isMe = (data['senderId'] == _firebaseAuth.currentUser!.uid) ? true : false;
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment:
                (data['senderId'] == _firebaseAuth.currentUser!.uid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            children: [
              Text(
                formattedDateTime.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              ChatBubble(
                isMe: isMe,
                message: data['message'],
              )
            ]),
      ),
    );
  }
}
