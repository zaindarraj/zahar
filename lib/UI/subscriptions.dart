import 'package:flutter/material.dart';
import 'package:zahar/main.dart';

import '../classes/api.dart';

class Subscribations extends StatefulWidget {
  const Subscribations({Key? key}) : super(key: key);

  @override
  State<Subscribations> createState() => _SubscribationsState();
}

class _SubscribationsState extends State<Subscribations> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Subscriptions"),
        backgroundColor: Colors.pink.shade100,
      ),
      body: FutureBuilder<dynamic>(
          future: API.getSubs(user!.userID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                Text(snapshot.data![index]["price"].toString() +
                                    "RS")
                              ],
                            ),
                          );
                     
                      }),
                );
              }
            }
            return  SizedBox(
                  width: size.width,
                  height: size.height,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: size.width * 0.2,
                                  height: size.height * 0.2,
                                  child: Image.asset(
                                    "assets/logo.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(1000.toString() +
                                        "RS"),
                                    IconButton(onPressed: (){

                                    }, icon: Icon(Icons.delete))
                                  ],
                                )
                              ],
                            ),
                          );
                     
                      }),
                );
            return Center(
              child: Text("Sorry no data found"),
            );
          }),
    );
  }
}
