import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:zahar/UI/add_card.dart';
import 'package:zahar/UI/location_screen.dart';
import 'package:zahar/classes/api.dart';
import 'package:zahar/classes/location.dart';
import 'package:zahar/classes/storage.dart';
import 'package:zahar/main.dart';

import 'design_screen.dart';

LocationClass? address;

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  State<ShippingScreen> createState() => _ShippingState();
}

class _ShippingState extends State<ShippingScreen> {
  bool cash = true;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Shipping to ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.4,
              child: Column(
                children: [
                  SizedBox(
                      width: size.width,
                      child: ListTile(
                        title: const Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        leading: const Icon(Icons.location_on_rounded),
                        subtitle: Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LocationScreen())).then((value) {
                                setState(() {});
                              });
                            },
                            child: const Text(
                              "Change settings",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      )),
                  address == null
                      ? FutureBuilder<Map<String, dynamic>?>(
                          future: Storage.getLocation(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                if (!snapshot.data!.containsValue(null)) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text("Country : "),
                                        subtitle: Text(snapshot.data!["country"]
                                            .toString()),
                                      ),
                                      ListTile(
                                        title: Text("City : "),
                                        subtitle: Text(
                                            snapshot.data!["city"].toString()),
                                      ),
                                      ListTile(
                                        title: Text("Street : "),
                                        subtitle: Text(snapshot.data!["street"]
                                            .toString()),
                                      ),
                                    ],
                                  );
                                } else {
                                  return FutureBuilder<Map<String, String>?>(
                                      future: LocationClass.getLocation(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          if (snapshot.hasData) {
                                            Storage.setLocation(
                                                snapshot.data!["country"]
                                                    .toString(),
                                                snapshot.data!["city"]
                                                    .toString(),
                                                snapshot.data!["street"]
                                                    .toString());
                                            return Column(
                                              children: [
                                                ListTile(
                                                  title: Text("Country : "),
                                                  subtitle: Text(snapshot
                                                      .data!["country"]
                                                      .toString()),
                                                ),
                                                ListTile(
                                                  title: Text("City : "),
                                                  subtitle: Text(snapshot
                                                      .data!["city"]
                                                      .toString()),
                                                ),
                                                ListTile(
                                                  title: Text("Street : "),
                                                  subtitle: Text(snapshot
                                                      .data!["street"]
                                                      .toString()),
                                                ),
                                              ],
                                            );
                                          }
                                        }
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                }
                              } else {
                                return const Center(
                                    child: Text(
                                        "Sorry no supplied location found"));
                              }
                            }
                            return Center(
                              child: Container(),
                            );
                          })
                      : Column(
                          children: [
                            ListTile(
                              title: Text("Country : "),
                              subtitle: Text(address!.country),
                            ),
                            ListTile(
                              title: Text("City : "),
                              subtitle: Text(address!.city),
                            ),
                            ListTile(
                              title: Text("Street : "),
                              subtitle: Text(address!.street),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  onTap: () async {
                    if ((await Storage.getCard())["cardID"] == null) {
                      //add card
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddCard()));
                    } else {
                      cash = false;
                    }

                    setState(() {});
                  },
                  selected: !cash,
                  leading: const Icon(Icons.card_membership),
                  title: const Text("Pay by card"),
                  subtitle: const Text("No fees applied"),
                ),
                ListTile(
                  onTap: () {
                    cash = true;
                    setState(() {});
                  },
                  selected: cash,
                  leading: const Icon(Icons.money),
                  title: const Text("Pay by cash"),
                  subtitle: const Text("fees applied"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  selectedDate.year.toString() +
                      "/" +
                      selectedDate.month.toString() +
                      "/" +
                      selectedDate.day.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ))
              ],
            ),
            ListTile(
                title: const Text("Total : "),
                subtitle: FutureBuilder<dynamic>(
                  future: API.getPrice(user!.userID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Text((double.parse(snapshot.data!["price"]) +
                                (cash ? 100 : 0))
                            .toString());
                      }
                    } else {}
                    return const Text("please try again");
                  },
                )),
            Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: TextButton(
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (user != null) {
                      String message = await API.orderAll(user!.userID);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message)));
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
