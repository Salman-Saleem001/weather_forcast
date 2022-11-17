import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  String? message;
  Future<String?> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      message = "Getting Location Success";
      return message;
    } catch (e) {
      return e.toString();
    }
  }
}
