import 'package:chatapp/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationSharingPage extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Sharing'),
      ),
      body: Obx(() {
        // ignore: unnecessary_null_comparison
        return controller.currentPosition.value != null
            ? GoogleMap(
                onMapCreated: (GoogleMapController controller) {},
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    controller.currentPosition.value.latitude,
                    controller.currentPosition.value.longitude,
                  ),
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("currentLocation"),
                    position: LatLng(
                      controller.currentPosition.value.latitude,
                      controller.currentPosition.value.longitude,
                    ),
                    infoWindow: const InfoWindow(title: "Current Location"),
                  ),
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getCurrentLocation();
        },
        tooltip: 'Get Location',
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
