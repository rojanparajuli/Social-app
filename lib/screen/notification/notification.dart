import 'package:chatapp/controller/notification_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: use_key_in_widget_constructors
class NotificationScreen extends StatelessWidget {
  final NotificationController _notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: RefreshIndicator(
        color: Colors.green,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 5));
        },
        child: ListView.builder(
          itemCount: 1001,
          itemBuilder: (context, index) {
            if (_notificationController.isNotificationDeleted(index)) {
              return Container();
            }
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              background: Container(
                color: Colors.lightGreen,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.lightGreen,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (direction) {
                _notificationController.dismissNotification(index);
              },
              child: Card(
                child: ListTile(
                  title: Text('Offer $index'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _notificationController.deleteNotification(index);
                    },
                  ),
                  onTap: () {
                    print('Tapped on notification $index');
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
