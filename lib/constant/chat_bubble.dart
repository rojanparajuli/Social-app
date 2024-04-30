import 'package:flutter/material.dart';


class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({super.key, required this.message, required this.isMe, MaterialColor? ChatBubble});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: isMe ? Colors.purpleAccent : Colors.white,
        //color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomRight:
              isMe ? const Radius.circular(0) : const Radius.circular(20),
          bottomLeft:
              isMe ? const Radius.circular(20) : const Radius.circular(0),
          //bottomRight: data['uid'] == currentUser!.uid
          //       ? const Radius.circular(0)
          //       : const Radius.circular(20),
          //   bottomLeft: data['uid'] == currentUser!.uid
          //       ? const Radius.circular(20)
          //       : const Radius.circular(0),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          message,
          style: TextStyle(color: isMe ? Colors.white : Colors.black, fontSize: 16),
        ),
      ]),
    );
    
  }
}

// Widget senderBubble(DocumentSnapshot data) {
//   // var t =
//   //     data['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
//   // var time = intl.DateFormat("h:mma").format(t);

  
// }
