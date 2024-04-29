// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ResetPasswordPage extends StatelessWidget {
//   const ResetPasswordPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Reset Password'),
//       content: const Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           TextField(
//             decoration: InputDecoration(
//               labelText: 'Phone number',
//             ),
//           ),
//           TextField(
//             obscureText: true,
//             decoration: InputDecoration(
//               labelText: 'New Password',
//             ),
//           ),
//           TextField(
//             obscureText: true,
//             decoration: InputDecoration(
//               labelText: 'Confirm Password',
//             ),
//           ),
//         ],
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             Get.back();
//           },
//           child: const Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Get.back();
//           },
//           child: const Text('Submit'),
//         ),
//       ],
//     );
//   }
// }
