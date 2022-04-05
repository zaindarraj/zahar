import 'package:flutter/material.dart';
import 'package:zahar/UI/location_screen.dart';
import 'package:zahar/UI/order.dart';
import 'package:zahar/UI/subscriptions.dart';
import 'package:zahar/main.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Stack(
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
              height: size.height * 0.2,
              width: size.width * 0.16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 30,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(Icons.person_add,
                        size: 30, color: Color.fromARGB(255, 196, 13, 74)),
                  ),
                  Text(user!.name, style: TextStyle(fontSize: 23),)
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.35,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Orders()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(5),
                    width: size.width,
                    height: size.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Orders",
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                   onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Subscribations()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(5),
                    width: size.width,
                    height: size.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Subscriptions",
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(5),
                    width: size.width,
                    height: size.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Location",
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
               
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: size.height * 0.6,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                width: size.width * 0.6,
                height: size.height * 0.1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Sign Out",
                      style: TextStyle(fontSize: 23),
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
