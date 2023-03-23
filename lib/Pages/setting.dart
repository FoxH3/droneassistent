import 'package:flutter/material.dart';
import 'package:droneassistent/widgets/darkmode.dart';
import '../widgets/appbar.dart';

/*
Bildet die Settings Page
*/

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => SettingState();
}

class SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Settings"),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: const Darkmode()),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: GlowingOverscrollIndicator(
                          axisDirection: AxisDirection.down,
                          color: Colors.black,
                          child: ListTile(
                              leading: Icon(
                                Icons.account_balance_outlined,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              title: Text(
                                "Informationen über die Applikation",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              onTap: () {
                                showAboutDialog(
                                  context: context,
                                  applicationIcon: const FlutterLogo(),
                                  applicationLegalese: 'Legalese',
                                  applicationName: 'Drone Assistent',
                                  applicationVersion: 'version 1.0.0',
                                );
                              }))),
                ],
              )),
        ));
  }
}
