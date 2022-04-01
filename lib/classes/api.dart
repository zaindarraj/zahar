import 'dart:convert';

import 'package:zahar/classes/order.dart';
import 'package:zahar/classes/user.dart';
import 'package:http/http.dart';
import 'package:zahar/main.dart';

String url = "http://10.0.2.2/zahar";

class API {
  static Future<dynamic> login(String phone, String password) async {
    Response response = await post(
      Uri.parse(url + "/login.php"),
      headers: <String, String>{
       
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'phone': phone, 'password': password}),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      if (jsonMap["code"] == "-1") {
        return jsonMap["message"];
      } else {
        return User.fromJson(jsonMap);
      }
    }
  }

  static Future<dynamic> subscribe(String userID, String productID) async {
    Response response = await post(
      Uri.parse(url + "/subscribe.php"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'userID': userID, 'productID': productID}),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      if (jsonMap["code"] == "1") {
        return jsonMap["message"];
      }
    }
  }

  static Future<dynamic> getPrice(String userID) async {
    try {
      Response response = await post(
        Uri.parse(url + "/getTotalPrice.php"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'userID': userID}),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return jsonMap;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  static Future<dynamic> getGeneral() async {
    try {
      Response response = await post(
        Uri.parse(url + "/getGeneral.php"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> jsonMap = jsonDecode(response.body);
        return jsonMap;
      }
    } catch (_) {
      return null;
    }
  }
static Future<dynamic> getByType(String type) async {
    try {
      Response response = await post(
        Uri.parse(url + "/getAll.php"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> jsonMap = jsonDecode(response.body);
        return jsonMap;
      }
    } catch (_) {
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>?> getCart(String userID) async {
    try {
      Response response = await post(Uri.parse(url + "/getCart.php"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{'user_id': userID},
          ));
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> jsonMap = jsonDecode(response.body);
        return jsonMap;
      }
    } catch (_) {
      return null;
    }
  }
    static Future<List<Map<String, dynamic>>?> getSubs(String userID) async {
    try {
      Response response = await post(Uri.parse(url + "/getSubs.php"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{'user_id': userID},
          ));
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> jsonMap = jsonDecode(response.body);
        return jsonMap;
      }
    } catch (_) {
      return null;
    }
  }
  static Future<List<Map<String, dynamic>>?> getOrders(String userID) async {
    try {
      Response response = await post(Uri.parse(url + "/getOrders.php"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{'user_id': userID},
          ));
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> jsonMap = jsonDecode(response.body);
        return jsonMap;
      }
    } catch (_) {
      return null;
    }
  }
  static Future<dynamic> addToCart(String userID, Order order) async {
    try {
      Response response = await post(Uri.parse(url + "/addToCart.php"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'user_id': userID,
              'code': order.code,
              "data": jsonEncode(order.data)
            },
          ));
      if (response.statusCode == 200) {
        return 1;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  static Future<dynamic> logup(
      String phone, String email, String password, String name) async {
    Response response = await post(
      Uri.parse(url + "/register.php"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phone,
        'password': password,
        "email": email,
        "name": name
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      if (jsonMap["code"] == "-1") {
        return jsonMap["message"];
      } else {
        return User.fromJson(jsonMap);
      }
    }
  }

  static Future<dynamic> orderAll(String userID) async {
    Response response = await post(
      Uri.parse(url + "/order.php"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "userID": userID,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      return jsonMap["message"];
    }
  }

  static Future<dynamic> getItem(String productID) async {
    try {
      Response response = await post(
        Uri.parse(url + "/getItem.php"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "productID": productID,
        }),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return jsonMap;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
