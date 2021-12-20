import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String firstName;
  String lastName;
  List<Book> books;

  User({
    required this.firstName,
    required this.lastName,
    required this.books,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json["firstName"],
      lastName: json["lastName"],
      books: (json["books"] as List).map((e) => Book.fromJson(e)).toList(),
    );
  }
   notifyListeners();
}

class Book {
  String title;
  String author;
  String details;
  double rating;
  String bookCover;
  List<Chapter> chapters;

  Book({
    required this.title,
    required this.author,
    required this.details,
    required this.rating,
    required this.bookCover,
    required this.chapters,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json["title"],
      author: json["author"],
      details: json["details"],
      rating: json["rating"],
      bookCover: json["bookCover"],
      chapters:
          (json["chapters"] as List).map((e) => Chapter.fromJson(e)).toList(),
          
    );
    
  }
  
}

class Chapter{
  String title;
  String description;
  List pages;
  int chapterNo;

  Chapter({
    required this.title,
    required this.description,
    required this.pages,
    required this.chapterNo,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      title: json["title"],
      description: json["description"],
      pages: json["pages"],
      chapterNo: json["chapterNo"],
    );
  }
}
