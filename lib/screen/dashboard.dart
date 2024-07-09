// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Dashboard extends StatelessWidget {
//   final TabController tabController = Get.put(TabController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         switch (tabController.selectedIndex.value) {
//           case 0:
//             return EventScreen();
//           case 1:
//             return PeopleScreen();
//           case 2:
//             return ChatScreen();
//           case 3:
//             return MoreScreen();
//           default:
//             return EventScreen();
//         }
//       }),
//       bottomNavigationBar: Obx(() {
//         return BottomNavigationBar(
//           currentIndex: tabController.selectedIndex.value,
//           onTap: tabController.changeTabIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.event),
//               label: 'Event',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.people),
//               label: 'People',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.chat),
//               label: 'Chat',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.more_horiz),
//               label: 'More',
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }