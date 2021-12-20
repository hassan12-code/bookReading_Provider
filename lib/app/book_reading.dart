import 'package:book_reading/providers/BookArguments_provider.dart';
import 'package:book_reading/providers/ChapterArguments_provider.dart';
import 'package:book_reading/providers/bookCover_provider.dart';
import 'package:book_reading/providers/generalUpdates_provider.dart';
import 'package:book_reading/providers/lastPoint_provider.dart';
import 'package:book_reading/providers/PersonArguments_provider.dart';
import 'package:book_reading/screens/book_view.dart';
import 'package:book_reading/screens/home.dart';
import 'package:book_reading/screens/page.dart';
import 'package:book_reading/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookReading extends StatelessWidget {
  BookReading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BookCoverClass(),
        ),
        ChangeNotifierProvider.value(value: lastPoint(),),
        ChangeNotifierProvider.value(value: GeneralUpdates(),),
        ChangeNotifierProvider.value(value: Person()),
        ChangeNotifierProvider.value(value: BookArguments(),),
        ChangeNotifierProvider.value(value: ChapterArguments(),),
      ], 
    child: MaterialApp(
      routes: {
        "/": (context) {
          return Splash();
        },
        Home.routeName: (context) {
          return Home();
        },
        BookView.routeName: (context) {
          return BookView();
        },
        PageReading.routeName: (context) {
          return PageReading();
        }
      },
    ));
  }
}
