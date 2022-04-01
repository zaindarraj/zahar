import 'package:flutter/material.dart';
import 'package:zahar/classes/storage.dart';
import 'shipping.dart';
import '../classes/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController street = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Settings"),
        backgroundColor: Colors.pink.shade100,
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder<Map<String, dynamic>?>(
                    future: Storage.getLocation(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          if (!snapshot.data!.containsValue(null)) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Text("Country : "),
                                  subtitle: Text(
                                      snapshot.data!["country"].toString()),
                                ),
                                ListTile(
                                  title: Text("City : "),
                                  subtitle:
                                      Text(snapshot.data!["city"].toString()),
                                ),
                                ListTile(
                                  title: Text("Street : "),
                                  subtitle:
                                      Text(snapshot.data!["street"].toString()),
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
                                          snapshot.data!["country"].toString(),
                                          snapshot.data!["city"].toString(),
                                          snapshot.data!["street"].toString());
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
                              child: Text("Sorry no supplied location found"));
                        }
                      }
                      return Center(
                        child: Container(),
                      );
                    }),
                Container(
                  width: size.width * 0.6,
                  height: size.height * 0.4,
                  child: Column(
                    children: [
                      TextField(
                        controller: country,
                        decoration: InputDecoration(label: Text("Country")),
                      ),
                      TextField(
                        controller: city,
                        decoration: InputDecoration(label: Text("City")),
                      ),
                      TextField(
                        controller: street,
                        decoration: InputDecoration(label: Text("Street Name")),
                      ),
                      TextButton(
                        onPressed: () {
                          address = LocationClass(
                              city: city.text,
                              country: country.text,
                              street: street.text);
                          print(address!.city);
                          Navigator.pop(context);
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.pink.shade100,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Use this location this time",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
