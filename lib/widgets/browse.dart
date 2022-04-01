import 'package:flutter/material.dart';
import 'package:zahar/UI/browse_screen.dart';
import 'package:zahar/UI/item.dart';
import 'package:zahar/classes/api.dart';

Widget browseByType(String type, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    width: size.width,
    height: size.height,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<dynamic>(
        future: API.getByType(browseType!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      chosenProduct = snapshot.data![index]["productID"];
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ItemScreen()));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          snapshot.data![index]["URL"],
                          
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: size.height*0.05,
                          child: Container(
                            width: size.width,
                            height: size.height*0.1,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text( snapshot.data![index]["price"].toString() + "RS"),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
            }
          }
          

        return const Center(
            child: Text("Sorry, no data found yet :/"),
            );
        },
      ),
    ),
  );
}
