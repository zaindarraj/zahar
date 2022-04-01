import 'package:flutter/material.dart';
import 'package:zahar/UI/sign_in.dart';
import 'package:zahar/classes/api.dart';
import 'package:zahar/classes/storage.dart';
import 'package:zahar/classes/user.dart';
import 'package:zahar/main.dart';

import '../widgets/button.dart';
import '../widgets/textField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController birthday = TextEditingController();
  String selectedGender = "male";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        title: const Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                  width: size.width,
                  height: size.height * 0.9,
                  child: Center(
                      child: Image.asset(
                    "assets/logo 2.png",
                    fit: BoxFit.contain,
                  ))),
              Positioned(
                top: size.height * 0.05,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: size.height * 0.18,
                  width: size.width * 0.16,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.person_add,
                        size: 27, color: Color.fromARGB(255, 196, 13, 74)),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.2,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: size.height * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: textField(
                                      size, "First Name", false, firstName)),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: textField(
                                      size, "Last Name", false, lastName)),
                            ],
                          ),
                          textField(size, "Email Address", false, email),
                          textField(size, "Password", true, password),
                          textField(size, "Birthday", false, birthday),
                          
                          textField(size, "Phone Number", false, phone),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.2,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          button("Sing Up", Theme.of(context).primaryColor,
                              size, context, () async {
                            dynamic response = await API.logup(
                                phone.text,
                                email.text,
                                password.text,
                                firstName.text + " " + lastName.text);

                            if (response.runtimeType == User) {
                              user = response;
                              await Storage.setInfo(user!.phone, password.text);
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Something went wrong, please try again")));
                            }
                          }),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignIn()))
                                    .then((value) {
                                  if (user != null) {
                                    Navigator.pop(context);
                                  }
                                });
                              },
                              child: const Text(
                                "Already have an account ? Sign in",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
