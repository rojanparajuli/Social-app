import 'package:chatapp/screen/drawer/drawer.dart';
import 'package:chatapp/screen/home/home_text.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screen/chat/chat_page.dart';
import 'package:chatapp/screen/notification/notification.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Exit App?',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            content: const Text(
              'Are you sure you want to exit the app?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ),
            ],
          ),
        );
        return exit;
      },
      child: Scaffold(
        appBar: AppBar(
          // title: const Text('Home Page'),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => NotificationScreen());
              },
              icon: const Icon(Icons.notifications, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                Get.to(() => const ChatInbox());
              },
              icon: const Icon(Icons.message, color: Colors.blue),
            ),
          ],
        ),
        drawer: DrawerScreen(),
        body: HomeText(),
      ),
    );
  }
}
