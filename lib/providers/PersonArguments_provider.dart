import 'package:book_reading/models/user.dart';
import 'package:flutter/cupertino.dart';

class Person with ChangeNotifier {
  String? firstName;
  String? lastName;
  List<Book> books=[];

  setValues(String fName, String lName, List<Book> bk)
  {
    this.firstName = fName;
    this.lastName = lName;
    this.books = bk;
    notifyListeners();
  }
}


