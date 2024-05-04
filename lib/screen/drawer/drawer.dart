import 'package:chatapp/constant/colors.dart';
import 'package:chatapp/controller/logout_controller.dart';
import 'package:chatapp/screen/error/access_denied.dart';
import 'package:chatapp/screen/sharelocation/share_location.dart';
import 'package:chatapp/service/save_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/screen/about/about.dart';
import 'package:chatapp/screen/profile/profile_screen.dart';

import '../../controller/location_controller.dart';

class DrawerScreen extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DrawerScreen({
    super.key,
  });

  final LogoutController _logoutController = Get.put(LogoutController());
  final Savinglogin savinglogin = Get.put(Savinglogin());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => Profile());
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: purple3,
              ),
              accountName: Text(firebaseAuth.currentUser?.email ?? ''),
              accountEmail: const Text(''),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/prayash.jpg'),
              ),
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Get.to(() => const AccessDeniedPage());
            },
          ),
          ListTile(
            title: const Text('Profile'),
            leading: const Icon(Icons.person),
            onTap: () {
              Get.to(() => Profile());
            },
          ),
          ListTile(
            title: const Text('Share Your Location'),
            leading: const Icon(Icons.location_on),
            onTap: () async {
              print("hello in settings");
              await controller.getCurrentLocation();

              controller.getAdressFromCoordinates();
              Get.to(() => LocationSharingPage());
            },
          ),
          ListTile(
            title: const Text('Report'),
            leading: const Icon(Icons.report),
            onTap: () {
              Get.to(() => const AccessDeniedPage());
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.book),
            onTap: () {
              Get.to(() => const AboutPageBody());
            },
          ),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                savinglogin.signOut();
                _logoutController.logout();
              },
            ),
          ],
        );
      },
    );
  }
}
