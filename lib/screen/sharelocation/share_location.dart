// import 'package:chatapp/controller/location_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Location Sharing'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GetBuilder<LocationController>(
//               init: LocationController(),
//               builder: (controller) {
//                 return Text(
//                   'Latitude: ${controller.latitude}, Longitude: ${controller.longitude}',
//                 );
//               },
//             ),
//             const SizedBox(height: 20),
//             Container(
//               height: 300,
//               width: MediaQuery.of(context).size.width,
//               child: GoogleMap(
//                 initialCameraPosition: const CameraPosition(
//                   target:  LatLng(0, 0), // Initial position will be overridden
//                   zoom: 15,
//                 ),
//                 markers: <Marker>{
//                   Marker(
//                     markerId: const MarkerId('current'),
//                     position: LatLng(
//                       Get.find<LocationController>().latitude,
//                       Get.find<LocationController>().longitude,
//                     ),
//                   ),
//                 },
//                 myLocationEnabled: true,
//                 myLocationButtonEnabled: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }