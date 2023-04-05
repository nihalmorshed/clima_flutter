import 'package:geolocator/geolocator.dart';

class LocationService {
  double lat = 0.0;
  double long = 0.0;
  double alt = 0.0;

  Future<void> getCurrentLocation() async {
    try {
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();

      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.longitude;
      alt = position.altitude;
    } catch (e) {
      print(e);
    }
  }
  // Ask permission from device
  // Future<void> requestPermission() async {
  // await Permission.location.request();
  // }
}
