import 'package:flutter/material.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({Key? key}) : super(key: key);

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  bool monthly = true;
  DateTime selectedDate = DateTime.now();
  bool random = true;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Subscription"),
        backgroundColor: Colors.pink.shade100,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height * 0.8,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(2),
                width: size.width,
                height: size.height * 0.21,
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        width: size.width,
                        color: Colors.grey,
                        child: Text(
                          "Select",
                          style: TextStyle(fontSize: 23),
                        )),
                    CheckboxListTile(
                        title: Text("Monthly"),
                        value: monthly,
                        onChanged: (newVal) {
                          monthly = newVal as bool;
                          setState(() {});
                        }),
                    CheckboxListTile(
                        title: Text("Annualy"),
                        value: !monthly,
                        onChanged: (newVal) {
                          monthly = !(newVal as bool);
                          setState(() {});
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    padding: EdgeInsets.all(2),
                    width: size.width,
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Choose Date",
                          style: TextStyle(fontSize: 23),
                        ),
                        Icon(
                          Icons.calendar_month,
                          size: 40,
                        )
                      ],
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    selectedDate.year.toString() +
                        "/" +
                        selectedDate.month.toString() +
                        "/" +
                        selectedDate.day.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    padding: EdgeInsets.all(2),
                    width: size.width,
                    color: Colors.grey,
                    child: const Text(
                      "Choosen Bouquet",
                      style: TextStyle(fontSize: 23),
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(5.0),
                child: CheckboxListTile(
                    title: Text("Randomly from store"),
                    value: random,
                    onChanged: (newVal) {
                      random = newVal as bool;
                      setState(() {});
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(5.0),
                child: CheckboxListTile(
                    title: Text("Choose from dashboard"),
                    value: !random,
                    onChanged: (newVal) {
                      random = !(newVal as bool);
                      setState(() {});
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(label: Text("Note")),
                ),
              ),
              TextButton(
                  onPressed: () {
                    
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(18),
                    child: Text("Done"),
                    decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(20)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
