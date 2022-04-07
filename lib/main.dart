import 'package:flutter/material.dart';
import 'package:zahar/UI/admin.dart';
import 'package:zahar/UI/dashboard.dart';
import 'package:zahar/classes/api.dart';
import 'package:zahar/classes/storage.dart';
import 'package:zahar/classes/user.dart';
import 'package:zahar/consts.dart';

import 'classes/order.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //مستخدم محلي

  try {
    Map<String, dynamic> savedUser = await Storage.getInfo();
    if (savedUser["phone"] != null) {
      if (savedUser["phone"] == adminPhone) {
        if (savedUser["password"] == adminPassword) {
          user = User(
              name: "admin",
              userID: "-1",
              email: "admin@gmail.com",
              password: adminPassword,
              phone: adminPhone);
        }
      } else {
        user = await API.login(savedUser["phone"], savedUser["password"]);
      }
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
      onGenerateRoute: (settings) {
        if (user != null) {
          if (user!.phone == adminPhone && user!.password == adminPassword) {
            return MaterialPageRoute(builder: (context) => const AdminScreen());
          } else {
           return MaterialPageRoute(builder: (context) => const Dashboard());
          }
        } else {
                    return MaterialPageRoute(builder: (context) => const Dashboard());

        }
      },
    );
  }
}
