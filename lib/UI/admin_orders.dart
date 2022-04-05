import 'package:flutter/material.dart';

class AdminOrders extends StatefulWidget {
  const AdminOrders({Key? key}) : super(key: key);

  @override
  State<AdminOrders> createState() => _AdminOrdersState();
}

class _AdminOrdersState extends State<AdminOrders> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Orders"),backgroundColor: Colors.grey,),
      body: FutureBuilder<List<Map<String, dynamic>>>(
          builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: size.width * 0.8,
                          height: size.height * 0.1,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                                offset: Offset(3, 0),
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 5)
                          ], borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data![index]["email"],
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete_forever))
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          }
        }
        return const Center(
          child: Text("CONNECT TO THTE INTERNET"),
        );
      }),
    );
  }
}
