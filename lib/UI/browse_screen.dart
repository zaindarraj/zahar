import 'package:flutter/material.dart';
import 'package:zahar/widgets/browse.dart';

String? browseType;

class BrowsingScreen extends StatefulWidget {
  const BrowsingScreen({Key? key}) : super(key: key);

  @override
  State<BrowsingScreen> createState() => _BrowsingScreenState();
}

class _BrowsingScreenState extends State<BrowsingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Browser by " + browseType!),
        backgroundColor: Colors.pink.shade100,
      ),
      body: browseByType(browseType!, context),
    );
  }
}
