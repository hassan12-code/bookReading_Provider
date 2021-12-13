import 'dart:convert';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageReading extends StatefulWidget {
  PageReading({Key? key}) : super(key: key);

  static const String routeName = '/page';

  @override
  State<PageReading> createState() => _PageReadingState();
}

class _PageReadingState extends State<PageReading> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final PageReadingArguments args =
        ModalRoute.of(context)!.settings.arguments as PageReadingArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.chapter.title),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                  onPageChanged: (int index) {
                    setLastLeftOffPoint(
                      book: args.book,
                      args: args,
                      chapterNo: args.chapter.chapterNo,
                      pageNo: index + 1,
                    );
                  },
                  children: args.chapter.pages
                      .map((page) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              args.chapter.pages[0],
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 21,
                                letterSpacing: 1,
                                wordSpacing: 1,
                              ),
                            ),
                          ))
                      .toList()),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text('$currentPage/${args.chapter.pages.length}',
                  style: GoogleFonts.poppins(fontSize: 21)),
            ),
          ],
        ),
      )),
    );
  }

  void setLastLeftOffPoint(
      {required Book book,
      required int chapterNo,
      required int pageNo,
      required PageReadingArguments args}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final lastPoint = LastPoint(
        bookTitle: book.title,
        bookAuthor: book.author,
        chapterNo: chapterNo,
        totalChapters: book.chapters.length,
        bookCover: book.bookCover,
        pageNo: pageNo);
    args.onLastPointChanged(lastPoint);

    _pref.setString("lastPoint", jsonEncode(lastPoint.toJson()));
  }
}

class PageReadingArguments {
  final Chapter chapter;
  final Book book;
  final Function(LastPoint) onLastPointChanged;

  PageReadingArguments(
      {required this.chapter,
      required this.book,
      required this.onLastPointChanged});
}
