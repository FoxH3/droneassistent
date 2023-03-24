import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateList extends StatefulWidget {
  const CreateList({Key? key}) : super(key: key);

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _locationController;
  late TextEditingController _startController;
  late TextEditingController _endController;
  late TextEditingController _descController;
  String name = "";
  String surname = "";
  String location = "";
  String start = "";
  String end = "";
  String desc = "";

  late SharedPreferences prefs;

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _locationController = TextEditingController();
    _startController = TextEditingController();
    _endController = TextEditingController();
    _descController = TextEditingController();
    _savechecklist();
  }

  _savechecklist() async {
    //Speichert die eingegebenen Werte lokal
    prefs = await SharedPreferences.getInstance();
    prefs.setString(
      "_name",
      _nameController.text.toString(),
    );
    prefs.setString(
      "_surname",
      _surnameController.text.toString(),
    );
    prefs.setString(
      "_location",
      _locationController.text.toString(),
    );
    prefs.setString(
      "_start",
      _startController.text.toString(),
    );
    prefs.setString(
      "_end",
      _endController.text.toString(),
    );
    prefs.setString(
      "_desc",
      _descController.text.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Create an Entry"),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Name:",
                                style:
                                    Theme.of(context).textTheme.titleMedium)),
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                              labelText: "Please enter your Name here"),
                        ),
                        const SizedBox(height: 20),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Surname:",
                                style:
                                    Theme.of(context).textTheme.titleMedium)),
                        TextField(
                          controller: _surnameController,
                          decoration: const InputDecoration(
                              labelText: "Please enter your Surname here"),
                        ),
                        const SizedBox(height: 20),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Location:",
                                style:
                                    Theme.of(context).textTheme.titleMedium)),
                        TextField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                              labelText: "Please enter your Location here"),
                        ),
                        const SizedBox(height: 20),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Starttime:",
                                style:
                                    Theme.of(context).textTheme.titleMedium)),
                        TextField(
                          controller: _startController,
                          decoration: const InputDecoration(
                              labelText: "Please enter your Starttime here"),
                        ),
                        const SizedBox(height: 20),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Endtime:",
                                style:
                                    Theme.of(context).textTheme.titleMedium)),
                        TextField(
                          controller: _endController,
                          decoration: const InputDecoration(
                              labelText: "Please enter your Endtime here"),
                        ),
                        const SizedBox(height: 20),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Description:",
                                style:
                                    Theme.of(context).textTheme.titleMedium)),
                        TextField(
                          controller: _descController,
                          decoration: const InputDecoration(
                              labelText: "Describe your activities"),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () async {
                              _savechecklist();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      'Entry was successfully saved',
                                      textAlign: TextAlign.center,
                                    )),
                              );
                            },
                            child: Text(
                              "Save the Entry",
                              style: Theme.of(context).textTheme.headlineSmall,
                            )),
                        const SizedBox(height: 300)
                      ],
                    )))));
  }
}
