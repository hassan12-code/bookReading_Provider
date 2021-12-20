import 'package:flutter/cupertino.dart';

class GeneralUpdates with ChangeNotifier {
  int page=1;

  int? updates(int pgNo)
  {
    this.page = pgNo;
    notifyListeners();
  }
}