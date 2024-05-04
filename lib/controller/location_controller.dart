import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../model/places_model.dart';

class LocationController extends GetxController {
  Rx<Position> currentPosition = Position(
          latitude: 0,
          longitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0.0,
          altitude: 0.0,
          altitudeAccuracy: 0.0,
          heading: 0.0,
          headingAccuracy: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0)
      .obs;
  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }


  var isGettingLocation = false;

  Position? currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  String currentAddress = "";
  bool locationSelected = false;
  PlaceLocation? pickedLocation;
  Future<void> savePlace(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      print(place);
      currentAddress = "${place.locality}, ${place.country}";
      print(currentAddress);
      print("😒");
      locationSelected = true;
      pickedLocation = PlaceLocation(
        latitude: latitude,
        longitude: longitude,
        address: currentAddress,
      );
      isGettingLocation = false;
    } catch (e) {
      print("Error in savePlace: $e");
    }
  }
  Future<Position?> getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("Service denied");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    isGettingLocation = true;
    print("Here");
    currentLocation = await Geolocator.getCurrentPosition();
    return currentLocation;
  }
  getAdressFromCoordinates() async {
    print('lll');
    try {
      print('hhh ${currentLocation!.latitude}');
      savePlace(currentLocation!.latitude, currentLocation!.longitude);
    } catch (e) {
      print(e);
    }
  }

  void exampleFunction({required int timestamp}) {
    print('Timestamp: $timestamp');
  }
}
