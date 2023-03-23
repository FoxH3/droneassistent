import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewList extends StatefulWidget {
  const ViewList({Key? key}) : super(key: key);

  @override
  State<ViewList> createState() => ChecklistState();
}

class ChecklistState extends State<ViewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("ViewList"),
      body: Container(),
    );
  }
}
