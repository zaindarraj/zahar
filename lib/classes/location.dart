import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationClass {
  String city;
  String country;
  String street;
  LocationClass(
      {required this.city, required this.country, required this.street});

  static Future<Map<String, String>?> getLocation() async {
    Location location;
    LocationPermission permission;
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();

    if ((await Geolocator.requestPermission() ==
                LocationPermission.whileInUse ||
            await Geolocator.requestPermission() ==
                LocationPermission.always) &&
        serviceEnabled) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position.longitude);

      try {
        List<Placemark> placeMark = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        print(placeMark);
        return {
          "country": placeMark.first.country.toString(),
          "city": placeMark.first.locality.toString(),
          "street": placeMark.first.street.toString()
        };
      } catch (e) {
        print(e);
      }
    } else {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      } else if (!serviceEnabled) {
        Geolocator.openLocationSettings();
      }
    }
  }
}
