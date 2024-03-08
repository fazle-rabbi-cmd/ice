import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  Locale _locale = Locale('en'); // Default locale is English

  Locale get locale => _locale;

  Locale get currentLocale => _locale; // Add this getter

  void setLocale(Locale newLocale) {
    if (_locale != newLocale) {
      _locale = newLocale;
      notifyListeners();
    }
  }
}
