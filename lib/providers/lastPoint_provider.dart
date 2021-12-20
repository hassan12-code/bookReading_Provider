import 'package:book_reading/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';



class lastPoint with ChangeNotifier{

    Book? book;
    int? chapterNo;
    int? pageNo;

    String? title;
    String? author;
    int? totalChapters;
    String? bookCover;


    lastPoint({
    this.title,
    this.author,
    this.chapterNo,
    this.totalChapters,
    this.pageNo,
    this.bookCover,
  });

    void setValues(Book bk, int chNo, int pgNo, String tit, String auth, int ttChaps, String cover)
    {
      this.book = bk;
      this.chapterNo = chNo;
      this.pageNo = pgNo;
      this.title = tit;
      this.author = auth;
      this.totalChapters = ttChaps;
      this.bookCover = cover;
      notifyListeners();
    }

  //   factory lastPoint.fromJson(Map<String, dynamic> json) {
  //   return lastPoint(
  //      title: json["bookTitle"],
  //       author: json["bookAuthor"],
  //       chapterNo: json["chapterNo"],
  //       totalChapters: json["totalChapters"],
  //       pageNo: json["pageNo"],
  //       bookCover: json["bookCover"]);
  // }

  // Map<String, dynamic> toJson() => {
  //       "bookTitle": this.title,
  //       "bookAuthor": this.author,
  //       "chapterNo": this.chapterNo,
  //       "totalChapters": this.totalChapters,
  //       "pageNo": this.pageNo,
  //       "bookCover": this.bookCover,
  //     };
  }
