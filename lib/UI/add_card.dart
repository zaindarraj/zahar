import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zahar/classes/storage.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController id = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController cvv = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Card Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "We accept any kind of card, paypal, google cards or apple pay",
              style: TextStyle(color: Colors.blue, fontSize: 23),
            ),
            TextField(
              controller: id,
              decoration: InputDecoration(
                  label: Text("Card Id"),
                  icon: Icon(Icons.card_giftcard_outlined)),
            ),
            TextField(
              controller: date,
              decoration: InputDecoration(
                  icon: Icon(Icons.date_range),
                  label: Text("Expire date"),
                  hintText: ("mm/yy")),
            ),
            TextField(
              controller: cvv,
              decoration: InputDecoration(
                label: Text("CVV"),
                icon: Icon(Icons.password_outlined),
              ),
            ),
            TextButton(
                onPressed: () async {
                  if (id.text.isNotEmpty &&
                      date.text.isNotEmpty &&
                      cvv.text.isNotEmpty) {
                    await Storage.setCard(id.text, date.text, cvv.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Done")));
                    
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all fields")));
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 23),
                ))
          ],
        ),
      ),
    );
  }
}
