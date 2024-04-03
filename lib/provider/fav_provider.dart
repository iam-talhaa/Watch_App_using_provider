import 'dart:js_interop';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class fav_provider with ChangeNotifier {
  List<int> _fav_items = [];

  List<int> get fav_items => _fav_items;

  void set_fav(int value) {
    _fav_items.add(value);
    notifyListeners();
  }

  void remove_fav(int value) {
    _fav_items.remove(value);
    notifyListeners();
  }
}
