import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewList extends StatefulWidget {
  const ViewList({Key? key}) : super(key: key);

  @override
  State<ViewList> createState() => _ViewlistState();
}

class _ViewlistState extends State<ViewList> {
  String name = "";
  String surname = "";
  String location = "";
  String start = "";
  String end = "";

  late SharedPreferences prefs;

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
  }

  _retrievechecklist() async {
    // holt die gespeicherten Werte
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString("_name")!;
    surname = prefs.getString("_surname")!;
    location = prefs.getString("_location")!;
    start = prefs.getString("_start")!;
    end = prefs.getString("_end")!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("View an Entry"),
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Name: $name",
                            style: Theme.of(context).textTheme.titleMedium)),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Surname: $surname",
                            style: Theme.of(context).textTheme.titleMedium)),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Location: $location",
                            style: Theme.of(context).textTheme.titleMedium)),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Starttime: $start",
                            style: Theme.of(context).textTheme.titleMedium)),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Endtime: $end",
                            style: Theme.of(context).textTheme.titleMedium)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          _retrievechecklist();
                        },
                        child: Text(
                          "Retrieve the Entry",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                  ],
                ))));
  }
}
