import 'package:flutter/material.dart';
import '/config/l10n/l10n.dart';

/* 
Der Locale Provider dient zur Implementation 
von mehreren Developer definierten Sprachen.
*/

class LocaleProvider extends ChangeNotifier {
  Locale _locale;
  LocaleProvider(this._locale);

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }
}
