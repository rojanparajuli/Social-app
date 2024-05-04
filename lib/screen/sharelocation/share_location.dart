import 'package:chatapp/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationSharingPage extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  //map images ko lagi  -------------------------------------
  Widget buildMapPreview() {
    if (controller.pickedLocation == null) {
      return Container(); // Return an empty container if no location is selected
    }

    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(controller.pickedLocation!.latitude,
            controller.pickedLocation!.longitude),
        initialZoom: 10.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          //subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 50,
              height: 60,
              point: LatLng(controller.pickedLocation!.latitude,
                  controller.pickedLocation!.longitude),
              child: const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Sharing'),
      ),
      body: Container(
        child: Stack(
          children: [
            buildMapPreview(),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                textAlign: TextAlign.start,
                controller.pickedLocation != null
                    ? controller.currentAddress
                    : controller.currentAddress,
                style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("hello");
          await controller.getCurrentLocation();

          controller.getAdressFromCoordinates();
        },
        tooltip: 'Get Location',
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
