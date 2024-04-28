import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<int> deletedIndexes = [];

  void deleteNotification(int index) {
    deletedIndexes.add(index);
    Get.snackbar('Notification', 'Notification $index deleted',
        duration: const Duration(seconds: 2));
  }

  void dismissNotification(int index) {
    deletedIndexes.add(index);
    Get.snackbar('Notification', 'Notification $index dismissed',
        duration: const Duration(seconds: 2));
  }

  bool isNotificationDeleted(int index) {
    return deletedIndexes.contains(index);
  }
}
