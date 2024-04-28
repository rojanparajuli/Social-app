import 'package:chatapp/controller/logout_controller.dart';
import 'package:chatapp/screen/error/access_denied.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/screen/about/about.dart';
import 'package:chatapp/screen/profile/profile_screen.dart';
import 'package:chatapp/screen/settings/settings.dart';

class DrawerScreen extends StatelessWidget {
   DrawerScreen({Key? key});

  final LogoutController _logoutController = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const Profile());
            },
            child: const UserAccountsDrawerHeader(
              accountName: Text('Prayash Rimal'),
              accountEmail: Text('Home'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/prayash.jpg'),
              ),
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Get.to(() =>  SettingPage());
            },
          ),
          ListTile(
            title: const Text('Profile'),
            leading: const Icon(Icons.person),
            onTap: () {
              Get.to(() => const Profile());
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
                _logoutController.logout();
              },
            ),
          ],
        );
      },
    );
  }
}
