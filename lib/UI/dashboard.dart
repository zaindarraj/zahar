import 'package:flutter/material.dart';
import 'package:zahar/UI/browse_screen.dart';
import 'package:zahar/UI/cart_screen.dart';
import 'package:zahar/UI/design_screen.dart';
import 'package:zahar/UI/profile.dart';
import 'package:zahar/UI/signup_screen.dart';
import 'package:zahar/classes/api.dart';

import '../main.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 1;
  final globalKey = GlobalKey<ScaffoldState>();
  List<Map<String,dynamic>> firstRow = [
    {
      "asset" : "assets/sales.jpg",
      "text" : "40 % OFF!"
    }
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: globalKey,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey,
            currentIndex: currentIndex,
            selectedItemColor: Color.fromARGB(255, 143, 41, 75),
            onTap: (index) {
              if (index != 2) {
                currentIndex = index;
                setState(() {});
              } else {
                globalKey.currentState!.openDrawer();
              }
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.phone), label: "Contact Us"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
           
            ]),
        backgroundColor: const Color.fromARGB(255, 214, 210, 210),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 214, 210, 210),
            leading: IconButton(
              onPressed: () {
                if (user != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                }
              },
              icon: const Icon(Icons.shopping_cart),
              color: Colors.black,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    }
                  },
                  icon: const Icon(Icons.person),
                  color: Colors.black)
            ]),
        body: Builder(
          builder: (context) {
            if (currentIndex == 1) {
              return SizedBox(
                width: size.width,
                height: size.height,
                child: ListView(
                  children: [
                    search(size),
                    firstList(size),
                    secondList(size, context),
                    thirdList(size, context),
                    subscriptions(size, context),
                  ],
                ),
              );
            } else {
              return Center(
                  child: Container(
                    width: size.width*0.9,
                    height: size.height*0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       SizedBox(
                        width: size.width*0.8,
                        height: size.height*0.1,
                        child: Text("We are ready to help, contact us any time !",textAlign: TextAlign.center,style: TextStyle(fontSize: 23),),),
                      SizedBox(
                        width: size.width*0.8,
                        height: size.height*0.1,
                        child: Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Zahar@gmail.com"),
                          Icon(Icons.email_rounded)
                        ]),
                      ),
                       SizedBox(
                        width: size.width*0.8,
                        height: size.height*0.1,
                        child: Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: [
                          Text("056567387"),
                          Icon(Icons.whatsapp_rounded)
                        ]),
                      ),
                       SizedBox(
                        width: size.width*0.8,
                        height: size.height*0.1,
                        child: Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Saudi Arabia, Makkah"),
                          Icon(Icons.location_city_rounded)
                        ]),
                      ),
                       SizedBox(
                        width: size.width*0.8,
                        height: size.height*0.1,
                        child: Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Zahar__22"),
                          Icon(Icons.image_rounded)
                        ]),
                      )
                    ],
                  ),
                ),
              ));
            }
          },
        ));
  }

  Column subscriptions(Size size, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.05,
          child: const Text(
            "Subscriptions",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Monthly or annual subscriptions that you receive at the location you specify",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: size.width,
            height: size.height * 0.3,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Row(
              children: [
                SizedBox(
                    width: size.width * 0.6,
                    height: size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "To give lively",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "and beauty",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "to your place",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )),
                Expanded(
                    child: Image.asset(
                  "assets/rose.jpg",
                  width: size.width * 0.4,
                  height: size.height * 0.3,
                  fit: BoxFit.cover,
                ))
              ],
            ),
          ),
        )
      ],
    );
  }

  Column thirdList(Size size, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.05,
          child: const Text(
            "Shope by occasion",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(5),
            width: size.width,
            height: size.height * 0.3,
            color: Theme.of(context).primaryColor,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    browseType = "newBorn";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowsingScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3)),
                    width: size.width * 0.4,
                    height: size.height * 0.3,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/newborn.jpg",
                          fit: BoxFit.cover,
                          width: size.width * 0.4,
                          height: size.height * 0.24,
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey,
                              child: const Text("New Born")),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    browseType = "graduation";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowsingScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3)),
                    width: size.width * 0.4,
                    height: size.height * 0.3,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/graduation.jpg",
                          fit: BoxFit.cover,
                          width: size.width * 0.4,
                          height: size.height * 0.24,
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey,
                              child: Text("Graduation")),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    browseType = "wellsoon";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowsingScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3)),
                    width: size.width * 0.4,
                    height: size.height * 0.3,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/wellsoon.jpg",
                          fit: BoxFit.cover,
                          width: size.width * 0.4,
                          height: size.height * 0.24,
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey,
                              child: Text("Get Well Soon")),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Column secondList(Size size, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.05,
          child: const Text(
            "Shope by",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(5),
            width: size.width,
            height: size.height * 0.3,
            color: Theme.of(context).primaryColor,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    browseType = "vase";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowsingScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3)),
                    width: size.width * 0.4,
                    height: size.height * 0.3,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/flowers in vase.jpg",
                          fit: BoxFit.cover,
                          width: size.width * 0.4,
                          height: size.height * 0.24,
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey,
                              child: Text("Flowers in vase")),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    browseType = "withChoclate";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowsingScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3)),
                    width: size.width * 0.4,
                    height: size.height * 0.3,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/flowers with choclate.jpg",
                          fit: BoxFit.cover,
                          width: size.width * 0.4,
                          height: size.height * 0.24,
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey,
                              child: Text("Flowers with choclate")),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    browseType = "boquet";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowsingScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3)),
                    width: size.width * 0.4,
                    height: size.height * 0.3,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/flowers in boqet.jpg",
                          fit: BoxFit.cover,
                          width: size.width * 0.4,
                          height: size.height * 0.24,
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey,
                              child: Text("Flowers in bouquet")),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DesignScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3)),
                    width: size.width * 0.4,
                    height: size.height * 0.3,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/design.jpg",
                          fit: BoxFit.cover,
                          width: size.width * 0.4,
                          height: size.height * 0.24,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.grey,
                            child: const Text(
                              "design your self",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Widget firstList(Size size) {
    return SizedBox(
        height: size.height * 0.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
                      itemCount: firstRow.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              width: size.width * 0.5,
                              height: size.height * 0.5,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Image.network(
                               firstRow[index]["asset"],
                                width: size.width * 0.5,
                                height: size.height * 0.5,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: size.width * 0.12,
                              top: size.height * 0.3,
                              child: Container(
                                width: size.width * 0.1,
                                height: size.height * 0.01,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(firstRow[index]["text"]),
                              ),
                            )
                          ],
                        );
                      }),
           
        );
  }
}

Widget search(Size size) {
  return Container(
    padding: const EdgeInsets.all(10),
    width: size.width * 0.8,
    height: size.height * 0.08,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black45),
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: const [
        Icon(
          Icons.search,
          color: Colors.grey,
        ),
        Text(
          "Search...",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}
