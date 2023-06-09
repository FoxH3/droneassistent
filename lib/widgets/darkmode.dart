import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/services/provider/darkmode_provider.dart';
//import 'package:flutter_gen/gen_l10n/app_localization.dart';

/*
Die Datei ist für das Bilden
der Dropdownliste der Dark und Light mode 
in der Settings Page
*/

class Darkmode extends StatefulWidget {
  const Darkmode({Key? key}) : super(key: key);

  @override
  State<Darkmode> createState() => DarkmodeState();
}

class DarkmodeState extends State<Darkmode> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.light_mode_outlined,
        color: Theme.of(context).colorScheme.tertiary,
      ),
      title: Text(
        "ThemeMode", //AppLocalizations.of(context)!.thememode,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: Consumer<ThemeProvider>(builder: (context, provider, child) {
        return SizedBox(
            width: 75,
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
              dropdownColor: Theme.of(context).colorScheme.secondary,
              value: provider.currentTheme,
              items: [
                DropdownMenuItem<String>(
                  value: 'light',
                  child: Text(
                    'Light',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'dark',
                  child: Text(
                    'Dark',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'system',
                  child: Text(
                    'System',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
              onChanged: (String? value) {
                provider.changeTheme(value ?? 'system');
              },
            )));
      }),
    );
  }
}
