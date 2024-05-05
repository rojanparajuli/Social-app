import 'package:chatapp/controller/network_error_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NetworkErrorPage extends StatelessWidget {
  final NetworkError networkError = Get.put(NetworkError());

   NetworkErrorPage({super.key});

  @override
  Widget build(BuildContext context) { 
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Internet Connectivity Example'),
        ),
        body: Center(
          child: Obx(
            () => networkError.isConnected.value
                ? const Text(
                    "Connected to the internet",
                    style: TextStyle(fontSize: 18),
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        size: 50,
                        color: Colors.red,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Oops! You are not connected to the internet",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}