import 'package:flutter/material.dart';

class AdminItem extends StatefulWidget {
  const AdminItem({Key? key}) : super(key: key);

  @override
  State<AdminItem> createState() => _AdminItemState();
}

class _AdminItemState extends State<AdminItem> {
  TextEditingController price = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.5,
                    child: Image.network(
                      snapshot.data!["imageURL"],
                      fit: BoxFit.fill,
                    ),
                  ),
                  TextField(
                    controller: price,
                    decoration: InputDecoration(
                      hintText: snapshot.data!["price"].toString(),
                      label: Text("Set New Price"),
                    ),
                  ),
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      hintText: snapshot.data!["name"].toString(),
                      label: Text("Set New Name"),
                    ),
                  ),
                  TextButton(onPressed: (){

                  }, 
                 child: Container(
                      alignment: Alignment.center,
                      padding : EdgeInsets.all(18),
                      color: Colors.blue,
                      child: Text("Submit", style: TextStyle(color: Colors.white),))),
                ],
              );
            }
          }
          return Center(
            child: Text("Please connect to the internet"),
          );
        },
      ),
    );
  }
}