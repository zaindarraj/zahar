import 'package:flutter/material.dart';
import 'package:zahar/classes/api.dart';
import 'package:zahar/main.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool toHome = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.pink.shade100,
        title: Text("Cart Screen"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height * 0.8,
          child: FutureBuilder<dynamic>(
            future: API.getCart(user!.userID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.2,
                                        height: size.height * 0.2,
                                        child: Text("Costume Design")
                                      ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                      ),
                      const TextField(
                        maxLength: 2,
                        decoration: InputDecoration(
                            label: Text("Note"), hintText: "If you want to."),
                      ),
                      TextButton(onPressed: () {}, child: Text("Order"))
                    ],
                  );
                }
              }

              
              return const Center(
                child: Text("Cart's empty ! browse and add to your cart"),
              );
            },
          ),
        ),
      ),
    );
  }
}
