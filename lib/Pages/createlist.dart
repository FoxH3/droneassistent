import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateList extends StatefulWidget {
  const CreateList({Key? key}) : super(key: key);

  @override
  State<CreateList> createState() => ChecklistState();
}

class ChecklistState extends State<CreateList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("CreateList"),
      body: Container(),
    );
  }
}
