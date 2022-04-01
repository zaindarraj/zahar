import 'package:flutter/material.dart';
import 'package:zahar/main.dart';

import '../classes/api.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
          backgroundColor: Colors.pink.shade100,
        ),
        body: FutureBuilder<dynamic>(
            future: API.getOrders(user!.userID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return SizedBox(
                    width: size.width,
                    height: size.height * 0.6,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          if (snapshot.data![index]["code"] == "0") {
                            return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              width: size.width * 0.9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: size.width * 0.2,
                                      height: size.height * 0.2,
                                      child: Text("Costume Design")),
                                  Text(snapshot.data![index]["price"]
                                          .toString() +
                                      "RS")
                                ],
                              ),
                            );
                          } else {
                            return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              width: size.width * 0.9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.2,
                                    height: size.height * 0.2,
                                    child: Image.network(
                                      snapshot.data![index]["imageURL"],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(snapshot.data![index]["price"]
                                          .toString() +
                                      "RS")
                                ],
                              ),
                            );
                          }
                        }),
                  );
                }
              }
              return Center(
                child: Text("Sorry no data found"),
              );
            }));
  }
}
