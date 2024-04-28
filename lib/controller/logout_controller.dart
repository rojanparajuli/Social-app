import 'package:get/get.dart';
import 'package:chatapp/screen/login/sign-up/login.dart';

class LogoutController extends GetxController {
  void logout() {
    print("Logout pressed!"); 
    Get.to(() => const LoginPage()); 
  }
}
