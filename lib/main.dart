import 'package:flutter/material.dart';
import 'package:zahar/UI/add_card.dart';
import 'package:zahar/UI/cart_screen.dart';
import 'package:zahar/UI/dashboard.dart';
import 'package:zahar/UI/design_screen.dart';
import 'package:zahar/UI/item.dart';
import 'package:zahar/UI/location_screen.dart';
import 'package:zahar/UI/shipping.dart';
import 'package:zahar/UI/sign_in.dart';
import 'package:zahar/UI/signup_screen.dart';
import 'package:zahar/UI/subscribe.dart';
import 'package:zahar/UI/subscriptions.dart';
import 'package:zahar/classes/api.dart';
import 'package:zahar/classes/storage.dart';
import 'package:zahar/classes/user.dart';

import 'classes/order.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //مستخدم محلي
  user = User(
      name: "Zahar",
      userID: "userID",
      email: "email",
      password: "password",
      phone: "phone");
  try {
    Map<String, dynamic> savedUser = await Storage.getInfo();
    if (savedUser["phone"] != null) {
      user = await API.login(savedUser["phone"], savedUser["password"]);
    }
  } catch (e) {}
  runApp(const MyApp());
}

User? user;
Order? order;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zahar',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(98, 255, 126, 126),
        secondaryHeaderColor: const Color.fromARGB(255, 238, 84, 84),
      ),
      home: const ShippingScreen(),
    );
  }
}
