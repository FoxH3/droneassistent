import 'package:droneassistent/Pages/checklist.dart';
import 'package:droneassistent/config/l10n/l10n.dart';
import 'package:flutter/material.dart';
import './Pages/setting.dart';
import './config/palette.dart';
import './pages/impressum.dart';
import 'package:provider/provider.dart';
import 'services/provider/locale_provider.dart';
import 'services/provider/darkmode_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Pages/noflymap.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<LocaleProvider>(
              create: (_) => LocaleProvider(const Locale("en"))),
          ChangeNotifierProvider<ColorProvider>(create: (_) => ColorProvider()),
          ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider()..initialize(),
          )
        ],
        builder: (context, child) {
          final languageProvider = Provider.of<LocaleProvider>(context);
          return Consumer<ThemeProvider>(builder: (context, provider, child) {
            return ScreenUtilInit(
              builder: ((context, child) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: Palette.lightTheme,
                    darkTheme: Palette.darkTheme,
                    themeMode: provider.themeMode,
                    locale: languageProvider.locale,
                    supportedLocales: L10n.all,
                    localizationsDelegates: const [
                      //AppLocalizations.delegate,
                      //GlobalMaterialLocalizations.delegate,
                      //GlobalWidgetsLocalizations.delegate
                    ],
                    home: const MyHomePage(),
                  )),
            );
          });
        },
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // Baut die eigentliche Homepage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 207, 207, 207),
            toolbarHeight: 80,
            elevation: 14,
            centerTitle: true,
            title: const Text(
              "Drone Assistent",
              style: TextStyle(color: Colors.black),
            ),
            leading: PopupMenuButton(
              padding: const EdgeInsets.all(10),
              elevation: 10,
              constraints: const BoxConstraints.expand(width: 500, height: 100),
              child: const Icon(
                Icons.dehaze_rounded,
                color: Colors.black,
                size: 30,
              ),
              onSelected: (value) {
                if (value == "Settings") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Setting()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Impressumview()),
                  );
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      value: 'Settings',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.settings,
                                size: 20,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Settings',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                          )
                        ],
                      )),
                  PopupMenuItem(
                      value: 'Impressum',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.account_balance_outlined,
                                size: 20,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Impressum',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                          )
                        ],
                      )),
                ];
              },
            )),
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        // Button welcher zur No Fly Map führt
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(370, 250),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor:
                                Theme.of(context).colorScheme.surfaceVariant),
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NoFlyMap()),
                            ),
                        child: Column(children: [
                          Icon(
                            Icons.location_on,
                            size: 100,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          Text(
                            "Map",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ])),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        // Button welcher zur Checklist Page führt
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(370, 250),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor:
                                Theme.of(context).colorScheme.surfaceVariant),
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Checklist()),
                            ),
                        child: Column(children: [
                          Icon(
                            Icons.check_box,
                            size: 100,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          Text(
                            "Checklist",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ])),
                  ],
                ))));
  }
}
