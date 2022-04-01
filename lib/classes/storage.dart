import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();


  static Future<void> setCard(String cardID, String expire, String cvv)async{
    await flutterSecureStorage.write(key: "cardID", value: cardID);
    await flutterSecureStorage.write(key: "expire", value: expire);
    await flutterSecureStorage.write(key: "cvv", value: cvv);
  }


 static Future<void> setLocation(String country, String city, String street) async {
    await flutterSecureStorage.write(key: "country", value: country);
    await flutterSecureStorage.write(key: "city", value: city);
    await flutterSecureStorage.write(key: "street", value: street);
  }

  static Future<void> setInfo(String phone, String password) async {
    await flutterSecureStorage.write(key: "phone", value: phone);
    await flutterSecureStorage.write(key: "password", value: password);
  }

  static Future<Map<String, dynamic>> getLocation() async {
    return {"country": await flutterSecureStorage.read(key: "country"),
    "city": await flutterSecureStorage.read(key: "city"),
    "street": await flutterSecureStorage.read(key: "street")};
  }
  static Future<Map<String, dynamic>> getInfo() async {
    return {"phone": await flutterSecureStorage.read(key: "phone"),
    "password": await flutterSecureStorage.read(key: "password"),
  };
  }

  static Future<Map<String, dynamic>> getCard() async {
    return {"cardID": await flutterSecureStorage.read(key: "cardID"),
    "expire": await flutterSecureStorage.read(key: "expire"),
    "cvv": await flutterSecureStorage.read(key: "cvv")};
  }

 
}
