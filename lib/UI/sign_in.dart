import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zahar/UI/admin.dart';
import 'package:zahar/classes/api.dart';
import 'package:zahar/classes/storage.dart';
import 'package:zahar/consts.dart';
import 'package:zahar/main.dart';
import 'package:zahar/widgets/button.dart';
import 'package:zahar/widgets/textField.dart';

import '../classes/user.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Stack(
          children: [
            Image.asset("assets/logo 2.png"),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.3,
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          textField(size, "Phone", false, phone),
                          textField(size, "Password", true, password),
                          button("Sign In", Colors.white, size, context,
                              () async {
                            if (phone.text == adminPhone) {
                              if (password.text == adminPassword) {
                                await Storage.setInfo(
                                    adminPhone, adminPassword);
                                user = User(
                                    name: "admin",
                                    userID: "-1",
                                    email: "admin@gmail.com",
                                    password: adminPassword,
                                    phone: adminPhone);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AdminScreen()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Wrong password")));
                              }
                            } else {
                              dynamic response =
                                  await API.login(phone.text, password.text);

                              if (response.runtimeType == User) {
                                await Storage.setInfo(
                                    phone.text, password.text);
                                user = response;
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(response.toString())));
                              }
                              Navigator.pop(context);
                            }
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
