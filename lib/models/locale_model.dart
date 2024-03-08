import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  late Locale _currentLocale;

  Locale get currentLocale => _currentLocale;

  LocaleModel() {
    // Initialize with the default locale (English)
    _currentLocale = Locale('en');
  }

  void setLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }
}
