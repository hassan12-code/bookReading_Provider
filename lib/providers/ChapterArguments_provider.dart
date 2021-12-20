
import 'package:book_reading/models/user.dart';
import 'package:flutter/cupertino.dart';

class ChapterArguments with ChangeNotifier{
  String? title;
  String? description;
  late List pages;
  late int chapterNo;
  late Book currentBook;
  void setValues(String title, String description, List pages,int chapterNo,Book currentBook){
    this.title = title;
    this.description = description;
    this.pages = pages;
    this.chapterNo = chapterNo;
    this.currentBook = currentBook;
    notifyListeners();
  }
}