import 'package:flutter/material.dart';
import 'package:zahar/UI/sign_in.dart';
import 'package:zahar/UI/signup_screen.dart';
import 'package:zahar/UI/subscribe.dart';
import 'package:zahar/classes/api.dart';
import 'package:zahar/classes/order.dart';
import 'package:zahar/classes/subscription.dart';

import '../main.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

String? chosenProduct;

class _ItemScreenState extends State<ItemScreen> {
  TextEditingController quantity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(child: FutureBuilder<dynamic>(
          future: API.getItem(chosenProduct!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.5,
                    child: Image.network(snapshot.data!["imageURL"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      color: Colors.pink.shade100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: size.height * 0.1,
                            child: Column(
                              children: [
                                Text(
                                  snapshot.data!["name"],
                                  style: TextStyle(fontSize: 23),
                                ),
                                Text(
                                  snapshot.data!["price"],
                                  style: TextStyle(fontSize: 23),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.2,
                            child: TextField(
                              controller: quantity,
                              decoration: const InputDecoration(
                                  label: Text("Quantity")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (user != null) {
                        int response = await API.addToCart(
                            user!.userID,
                            Order(
                                userID: user!.userID,
                                data: {
                                  "quantity": quantity.text,
                                  "productID": chosenProduct!
                                },
                                code: "1"));
                        if (response == 1) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Done")));
                        }else {
                           ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Somthing went wrong/")));
                        }
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: size.width * 0.6,
                      height: size.height * 0.06,
                      alignment: Alignment.center,
                      child: const Text("Add to cart"),
                      decoration: BoxDecoration(
                          color: Colors.pink.shade100,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Subscribe())));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: size.width * 0.6,
                      height: size.height * 0.06,
                      alignment: Alignment.center,
                      child: const Text("Submit to subscription"),
                      decoration: BoxDecoration(
                          color: Colors.pink.shade100,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              );}
            }
            return Center(child: Text("Internet Problem"));
          },
        )),
      ),
    );
  }
}
