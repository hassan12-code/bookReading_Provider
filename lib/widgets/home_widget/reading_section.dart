import 'dart:developer';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/book_information.dart';
import 'package:flutter/material.dart';

class ReadingSection extends StatefulWidget {
  ReadingSection({
    Key? key,
    required this.books,
    required this.onLastPointChanged,
  }) : super(key: key);

  final List<Book> books;
  final Function(LastPoint) onLastPointChanged;

  @override
  State<ReadingSection> createState() => _ReadingSectionState();
}

class _ReadingSectionState extends State<ReadingSection> {
  bool isShowingCover = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "What are you\nReading Today?",
            style: TextStyle(fontSize: 25),
          ),
        ),
        Container(
          height: screenHeight(context) * 0.4,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 25),
            scrollDirection: Axis.horizontal,
            children: widget.books.map(
              (book) {
                return Padding(
                  key: Key(book.title),
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        BookInformation(
                            book: book,
                            onShowingDetails: (bool isShowingDetails) {
                              setState(() {
                                isShowingCover = !isShowingDetails;
                              });
                            },
                            onLastPointChanged: (LastPoint lastPoint) {
                              log("PRINT LAST POINT CHANGED FROM READING SECTION");
                              widget.onLastPointChanged(lastPoint);
                            }),
                        isShowingCover == true
                            ? Positioned(
                                top: -20,
                                left: 25,
                                child: BookCover(bookCover: book.bookCover))
                            : SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        )
      ],
    );
  }
}
