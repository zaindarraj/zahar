import 'package:flutter/material.dart';
import 'package:zahar/UI/signup_screen.dart';
import 'package:zahar/classes/api.dart';
import 'package:zahar/main.dart';

import '../classes/order.dart';

double price = 0;

class DesignScreen extends StatefulWidget {
  const DesignScreen({Key? key}) : super(key: key);

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  Offset? position;
  Order? order;
  bool firstItem = true;
  List<Map<String, dynamic>> isVasaDropped = [
    {"assets/vases/blue.png": false, "price": 14},
    {"assets/vases/white.png": false, "price": 12},
    {"assets/vases/pink.png": false, "price": 12}
  ];
  List<Map<String, dynamic>> isRoseDropped = [
    {"assets/roses/white.png": false, "price": 12},
    {"assets/roses/red.png": false, "price": 12},
    {"assets/roses/rose.png": false, "price": 12}
  ];
  List<Map<String, dynamic>> isBouquteDropped = [
    {"assets/bouqut/1.png": false, "price": 12},
    {"assets/bouqut/2.png": false, "price": 12},
    {"assets/bouqut/3.png": false, "price": 12}
  ];

  bool logoVisiable = true;
  @override
  void initState() {
    super.initState();
    position = const Offset(0.0, 100 - 20);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            DragTarget<Map<String, dynamic>>(
              builder: (
                BuildContext context,
                List<Object?> accepted,
                List<dynamic> rejected,
              ) {
                return Center(
                  child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.6,
                      width: size.height * 0.6,
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              width: size.width,
                              height: size.height * 0.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Price : " + price.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                     

                                      if (user != null) {
                                         order = Order(
                                          userID: user!.userID, data: {"price" : price.toString(),"productID": "0"}, code: "0");
                                        if (await API.addToCart(
                                                user!.userID, order!) !=
                                            null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text("Done")));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text("Sign in ")));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignupScreen()));
                                      }
                                    },
                                    child: SizedBox(
                                      width: size.width * 0.35,
                                      child: Row(
                                        children: const [
                                          Text("Add to cart"),
                                          Icon(
                                            Icons.shopping_bag,
                                            size: 40,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: size.height * 0.1,
                            child: Visibility(
                              visible: logoVisiable,
                              child: Center(
                                child: SizedBox(
                                    height: size.height * 0.4,
                                    child: Image.asset(
                                      "assets/logo.png",
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: size.height * 0.24,
                            left: size.width * 0.39,
                            child: Visibility(
                              visible: isRoseDropped[0].values.first,
                              child: Center(
                                child: SizedBox(
                                    width: size.width * 0.26,
                                    height: size.height * 0.35,
                                    child: Image.asset(
                                      isRoseDropped[0].keys.first,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: size.height * 0.24,
                            left: size.width * 0.39,
                            child: Visibility(
                              visible: isRoseDropped[1].values.first,
                              child: Center(
                                child: SizedBox(
                                    width: size.width * 0.26,
                                    height: size.height * 0.35,
                                    child: Image.asset(
                                      isRoseDropped[1].keys.first,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: size.height * 0.24,
                            left: size.width * 0.39,
                            child: Visibility(
                              visible: isRoseDropped[2].values.first,
                              child: Center(
                                child: SizedBox(
                                    width: size.width * 0.26,
                                    height: size.height * 0.35,
                                    child: Image.asset(
                                      isRoseDropped[2].keys.first,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: size.height * 0.03,
                            child: Visibility(
                                visible:
                                    isBouquteDropped[0].entries.first.value,
                                child: SizedBox(
                                    width: size.width * 0.40,
                                    height: size.height * 0.35,
                                    child: Image.asset(
                                      isBouquteDropped[0].keys.first,
                                      fit: BoxFit.fill,
                                      width: size.width * 0.3,
                                      height: size.height * 0.2,
                                    ))),
                          ),
                          Positioned(
                            bottom: size.height * 0.03,
                            child: Visibility(
                                visible:
                                    isBouquteDropped[1].entries.first.value,
                                child: SizedBox(
                                    width: size.width * 0.40,
                                    height: size.height * 0.35,
                                    child: Image.asset(
                                      isBouquteDropped[1].keys.first,
                                      fit: BoxFit.fill,
                                      width: size.width * 0.3,
                                      height: size.height * 0.2,
                                    ))),
                          ),
                          Positioned(
                            bottom: size.height * 0.03,
                            child: Visibility(
                                visible:
                                    isBouquteDropped[2].entries.first.value,
                                child: SizedBox(
                                    width: size.width * 0.40,
                                    height: size.height * 0.35,
                                    child: Image.asset(
                                      isBouquteDropped[2].keys.first,
                                      fit: BoxFit.fill,
                                      width: size.width * 0.3,
                                      height: size.height * 0.2,
                                    ))),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Visibility(
                                visible: isVasaDropped[0].entries.first.value,
                                child: SizedBox(
                                    width: size.width * 0.53,
                                    height: size.height * 0.35,
                                    child: Image.asset(
                                      isVasaDropped[0].keys.first,
                                      fit: BoxFit.contain,
                                      width: size.width * 0.3,
                                      height: size.height * 0.2,
                                    ))),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Visibility(
                                visible: isVasaDropped[1].entries.first.value,
                                child: SizedBox(
                                    width: size.width * 0.53,
                                    height: size.height * 0.35,
                                    child: Image.asset(
                                      isVasaDropped[1].keys.first,
                                      fit: BoxFit.contain,
                                      width: size.width * 0.3,
                                      height: size.height * 0.2,
                                    ))),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Visibility(
                                visible: isVasaDropped[2].entries.first.value,
                                child: SizedBox(
                                    width: size.width * 0.53,
                                    height: size.height * 0.35,
                                    child: Image.asset(
                                      isVasaDropped[2].keys.first,
                                      fit: BoxFit.contain,
                                      width: size.width * 0.3,
                                      height: size.height * 0.2,
                                    ))),
                          ),
                        ],
                      )),
                );
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                isVasaDropped.asMap().forEach((index, value) {
                  if (isVasaDropped[index].values.first == true &&
                      (isBouquteDropped.contains(data) ||
                          isVasaDropped.contains(data))) {
                    price = price - isVasaDropped[index].values.last;
                  }
                  if (data.keys.first == isVasaDropped[index].keys.first) {
                    price = price + isVasaDropped[index].values.last;

                    isVasaDropped[index][isVasaDropped[index].keys.first] =
                        true;
                    firstItem = false;
                    logoVisiable = false;
                  } else if (!isRoseDropped.contains(data)) {
                    isVasaDropped[index][isVasaDropped[index].keys.first] =
                        false;
                  }
                });
                isBouquteDropped.asMap().forEach((index, value) {
                  if (isBouquteDropped[index].values.first == true &&
                      (isBouquteDropped.contains(data) ||
                          isVasaDropped.contains(data))) {
                    price = price - isBouquteDropped[index].values.last;
                  }
                  if (data.keys.first == isBouquteDropped[index].keys.first) {
                    price = price + isBouquteDropped[index].values.last;

                    isBouquteDropped[index]
                        [isBouquteDropped[index].keys.first] = true;
                    firstItem = false;
                    logoVisiable = false;
                  } else if (!isRoseDropped.contains(data)) {
                    isBouquteDropped[index]
                        [isBouquteDropped[index].keys.first] = false;
                  }
                });
                if (!firstItem) {
                  isRoseDropped.asMap().forEach((index, value) {
                    if (isRoseDropped[index].values.first == true &&
                        isRoseDropped.contains(data)) {
                      price = price - isRoseDropped[index].values.last;
                    }
                    if (data.keys.first == isRoseDropped[index].keys.first) {
                      price = price + isRoseDropped[index].values.last;
                      isRoseDropped[index][isRoseDropped[index].keys.first] =
                          true;
                    } else if (isRoseDropped.contains(data)) {
                      isRoseDropped[index][isRoseDropped[index].keys.first] =
                          false;
                    }
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("Please chose a vasa or bouqute first :)")));
                }
                setState(() {});
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    "Vase Shape",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).textScaleFactor * 24),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: isVasaDropped.length,
                      itemBuilder: (context, index) {
                        return Draggable<Map<String, dynamic>>(
                          data: isVasaDropped[index],
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: size.width * 0.3,
                                height: size.height * 0.25,
                                child: Image.asset(
                                  isVasaDropped[index].keys.first,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: size.width * 0.3,
                                height: size.height * 0.05,
                                color: Colors.grey.withOpacity(0.4),
                                child: Text(isVasaDropped[index]
                                    .values
                                    .last
                                    .toString()),
                              )
                            ],
                          ),
                          feedback: SizedBox(
                              width: size.width * 0.25,
                              height: size.height * 0.25,
                              child: Image.asset(
                                isVasaDropped[index].keys.first,
                                fit: BoxFit.fill,
                              )),
                          onDraggableCanceled:
                              (Velocity velocity, Offset offset) {
                            setState(() => position = offset);
                          },
                        );
                      },
                    ),
                  ),
                  Text(
                    "Bouqute Shape",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).textScaleFactor * 24),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: isBouquteDropped.length,
                        itemBuilder: (context, index) {
                          return Draggable<Map<String, dynamic>>(
                            data: isBouquteDropped[index],
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  width: size.width * 0.3,
                                  height: size.height * 0.25,
                                  child: Image.asset(
                                    isBouquteDropped[index].keys.first,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: size.width * 0.3,
                                  height: size.height * 0.05,
                                  color: Colors.grey.withOpacity(0.4),
                                  child: Text(isBouquteDropped[index]
                                      .values
                                      .last
                                      .toString()),
                                )
                              ],
                            ),
                            feedback: SizedBox(
                                width: size.width * 0.25,
                                height: size.height * 0.25,
                                child: Image.asset(
                                  isBouquteDropped[index].keys.first,
                                  fit: BoxFit.fill,
                                )),
                            onDraggableCanceled:
                                (Velocity velocity, Offset offset) {
                              setState(() => position = offset);
                            },
                          );
                        }),
                  ),
                  Text(
                    "Roses",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).textScaleFactor * 24),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: isRoseDropped.length,
                        itemBuilder: (context, index) {
                          return Draggable<Map<String, dynamic>>(
                            data: isRoseDropped[index],
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  width: size.width * 0.3,
                                  height: size.height * 0.25,
                                  child: Image.asset(
                                    isRoseDropped[index].keys.first,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: size.width * 0.3,
                                  height: size.height * 0.05,
                                  color: Colors.grey.withOpacity(0.4),
                                  child: Text(isRoseDropped[index]
                                      .values
                                      .last
                                      .toString()),
                                )
                              ],
                            ),
                            feedback: SizedBox(
                                width: size.width * 0.25,
                                height: size.height * 0.25,
                                child: Image.asset(
                                  isRoseDropped[index].keys.first,
                                  fit: BoxFit.fill,
                                )),
                            onDraggableCanceled:
                                (Velocity velocity, Offset offset) {
                              setState(() => position = offset);
                            },
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
