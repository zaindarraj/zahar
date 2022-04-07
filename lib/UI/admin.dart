import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zahar/UI/admin_orders.dart';
import 'package:zahar/classes/image.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  ImagePicker imagePicker = ImagePicker();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  XFile? image;
  String? base;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset("assets/logo 2.png")),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(18),
                  width: size.width * 0.8,
                  height: size.height * 0.81,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 10,
                            offset: Offset(3, 0),
                            color: Colors.grey)
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () async {
                          image = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            base = await ImageBase64.baseFromImage(image!);
                            print(base);
                            setState(() {});
                          }
                        },
                        subtitle: TextButton(
                          onPressed: () {
                            if (image != null) {
                              //upload
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "please choose an image to upload first")));
                            }
                          },
                          child: Text(image == null
                              ? "No Image Chosen"
                              : "Upload " + image!.name),
                        ),
                        leading: Icon(Icons.browse_gallery_rounded),
                        title: Text("Choose Image From Gallery"),
                      ),
                      TextField(
                        controller: name,
                        decoration: InputDecoration(label: Text("Name")),
                      ),
                      TextField(
                        controller: price,
                        decoration: InputDecoration(label: Text("Price")),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(18),
                              color: Colors.blue,
                              child: Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              ))),
                      Column(
                        children: [
                          Text("Browser and Edit"),
                          FutureBuilder<List<Map<String, dynamic>>?>(
                              builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return SizedBox(
                                  width: size.width,
                                  height: size.height * 0.35,
                                  child: ListView.builder(
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(8),
                                              width: size.width,
                                              height: size.height * 0.2,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                      snapshot.data![index]
                                                          ["imageURL"])),
                                            ),
                                            Positioned(
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Container(
                                                  margin: EdgeInsets.all(8),
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  child: Text(
                                                    snapshot.data![index]
                                                          ["price"],
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        );
                                      }),
                                );
                              }
                            }

                            return Text(
                                "Connect to the internet to fetch the data");
                          }),
                        ],
                      )
                    ],
                  ),
                )),
            Positioned(
                top: 0,
                left: 0,
                child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminOrders()));
                      },
                      icon: Icon(Icons.notification_add)),
                )),
          ],
        ),
      ),
    );
  }
}
