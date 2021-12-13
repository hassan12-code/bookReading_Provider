import 'dart:developer';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/book_of_the_day.dart';
import 'package:book_reading/widgets/home_widget/circle_notch.dart';
import 'package:book_reading/widgets/home_widget/continue_reading.dart';
import 'package:book_reading/widgets/home_widget/rating.dart';
import 'package:book_reading/widgets/home_widget/reading_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomeArgs;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CircleNotch(),
            Align(
              alignment: Alignment(2.5, -1.4),
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE8BEB5),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                ReadingSection(
                    books: args.user.books,
                    onLastPointChanged: (LastPoint lastPoint) {
                      log("PRINTING LAST POINT CHANGED FROM HOME");
                      setState(() {
                        args.lastPoint = lastPoint;
                      });
                    }),
                BestOfTheDay(book: getBestOfTheDayBook(args.user.books)),
                if (args.lastPoint != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ContinueReading(lastPoint: args.lastPoint!),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Book getBestOfTheDayBook(List<Book> books) {
    List<Book> booksToSort = books.map((e) => e).toList();
    booksToSort.sort((a, b) => b.rating.compareTo(a.rating));

    return booksToSort.first;
  }
}

class HomeArgs {
  User user;

  LastPoint? lastPoint;

  HomeArgs({required this.user, this.lastPoint});
}
