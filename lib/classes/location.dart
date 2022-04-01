import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';

class LocationClass {
  String city;
  String country;
  String street;
  LocationClass(
      {required this.city, required this.country, required this.street});

  static Future<Map<String, String>?> getLocation() async {
    Location location = Location();
    if (await location.requestPermission() == PermissionStatus.granted &&
        await location.requestService()) {
      location.changeSettings(accuracy: LocationAccuracy.high);
      LocationData locationData = await location.getLocation();
      try {
        List<geo.Placemark> placeMark = await geo.placemarkFromCoordinates(
            locationData.latitude as double, locationData.longitude as double);
        return {
          "country": placeMark.first.country.toString(),
          "city": placeMark.first.locality.toString(),
          "street": placeMark.first.street.toString()
        };
      } catch (e) {}
    }
  }
}
