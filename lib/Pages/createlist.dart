import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String vorname = "";
String nachname = "";
String startort = "";
String startzeitpunkt = "";
String endzeitpunkt = "";

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
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Vorname:",
                            style: Theme.of(context).textTheme.titleMedium)),
                    const TextField(),
                    const SizedBox(height: 30),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Nachname:",
                            style: Theme.of(context).textTheme.titleMedium)),
                    const TextField(),
                    const SizedBox(height: 30),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Startort:",
                            style: Theme.of(context).textTheme.titleMedium)),
                    const TextField(),
                    const SizedBox(height: 30),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Startzeitpunkt:",
                            style: Theme.of(context).textTheme.titleMedium)),
                    const TextField(),
                    const SizedBox(height: 30),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Endzeitpunkt",
                            style: Theme.of(context).textTheme.titleMedium)),
                    const TextField(),
                  ],
                ))));
  }
}
