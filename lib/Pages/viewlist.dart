import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
Hier wird die Checklist View Page gebildet
*/

class ViewList extends StatefulWidget {
  const ViewList({Key? key}) : super(key: key);

  @override
  State<ViewList> createState() => _ViewlistState();
}

class _ViewlistState extends State<ViewList> {
  late SharedPreferences prefs;

  String name = "";
  String surname = "";
  String location = "";
  String start = "";
  String end = "";
  String desc = "";

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
  }

  _retrieve() async {
    // holt die gespeicherten Werte aus Shared Preferences
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString("_name")!;
    surname = prefs.getString("_surname")!;
    location = prefs.getString("_location")!;
    start = prefs.getString("_start")!;
    end = prefs.getString("_end")!;
    desc = prefs.getString("_desc")!;
    setState(() {});
  }

  _delete() async {
    // Löscht die gespeicherten Werte und füllt diese mit "".
    // Letzteres dient zur Aktualisierung & Vermeidung eines Null Pointer Errors.
    prefs = await SharedPreferences.getInstance();
    prefs.remove("_name");
    prefs.remove("_surname");
    prefs.remove("_location");
    prefs.remove("_start");
    prefs.remove("_end");
    prefs.remove("_desc");

    prefs.setString(
      "_name",
      "",
    );
    prefs.setString(
      "_surname",
      "",
    );
    prefs.setString(
      "_location",
      "",
    );
    prefs.setString(
      "_start",
      "",
    );
    prefs.setString(
      "_end",
      "",
    );
    prefs.setString(
      "_desc",
      "",
    );
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
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Description: $desc",
                            style: Theme.of(context).textTheme.titleMedium)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          _retrieve();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Entry was successsfully loaded',
                                  textAlign: TextAlign.center,
                                )),
                          );
                        },
                        child: Text(
                          "Retrieve the Entry",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          _delete();
                          _retrieve();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Entry was successfully deleted',
                                  textAlign: TextAlign.center,
                                )),
                          );
                        },
                        child: Text(
                          "Delete the Entry",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                  ],
                ))));
  }
}
