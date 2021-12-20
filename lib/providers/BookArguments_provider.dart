
import 'package:book_reading/models/user.dart';
import 'package:flutter/cupertino.dart';

class BookArguments with ChangeNotifier {
  String? title;
  String? author;
  String? details;
  double rating=0;
  String? bookCover;
  late List chapters;
  late Book currentBook;

  setValues(String title,String author,String details,double rating,String bookCover,List chapters, Book book)
  {
    this.title = title;
    this.author = author;
    this.details = details;
    this.rating = rating;
    this.bookCover = bookCover;
    this.chapters = chapters;
    this.currentBook = book;
    notifyListeners();
  }
}