import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'createlist.dart';
import 'viewlist.dart';

class Checklist extends StatefulWidget {
  const Checklist({Key? key}) : super(key: key);

  @override
  State<Checklist> createState() => ChecklistState();
}

class ChecklistState extends State<Checklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Checklist"),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  // Button welcher zur CreateList Page führt
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(370, 290),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      backgroundColor:
                          Theme.of(context).colorScheme.surfaceVariant),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateList()),
                      ),
                  child: Column(children: [
                    Icon(
                      Icons.view_list_outlined,
                      size: 100,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    Text(
                      "Create New Checklist",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ])),
              const SizedBox(height: 30),
              ElevatedButton(
                  // Button welcher zur ViewList führt
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(370, 290),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      backgroundColor:
                          Theme.of(context).colorScheme.surfaceVariant),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ViewList()),
                      ),
                  child: Column(children: [
                    Icon(
                      Icons.library_books_sharp,
                      size: 100,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    Text(
                      "View existing Checklists",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ])),
            ],
          ),
        )));
  }
}
