import 'package:chatapp/controller/tab_bar_controller.dart';
import 'package:chatapp/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  final TabControllers tabController = Get.put(TabControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (tabController.selectedIndex.value) {
          case 0:
            return HomePage();
          case 1:
            return HomePage();
          case 2:
            return HomePage();
          case 3:
            return HomePage();
          default:
            return HomePage();
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: tabController.selectedIndex.value,
          onTap: tabController.changeTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Event',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
        );
      }),
    );
  }
}