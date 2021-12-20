import 'package:book_reading/providers/BookArguments_provider.dart';
import 'package:book_reading/providers/ChapterArguments_provider.dart';
import 'package:book_reading/providers/generalUpdates_provider.dart';
import 'package:book_reading/providers/lastPoint_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageReading extends StatefulWidget {
  PageReading({Key? key}) : super(key: key);

  static const String routeName = '/page';

  @override
  State<PageReading> createState() => _PageReadingState();
}

class _PageReadingState extends State<PageReading> {
  int totalChapters = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<ChapterArguments>(context).title.toString()),
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
                    Provider.of<GeneralUpdates>(context, listen: false).updates(index+1);
                    Provider.of<lastPoint>(context, listen: false).setValues(
                      Provider.of<ChapterArguments>(context,listen: false).currentBook,
                      Provider.of<ChapterArguments>(context,listen: false).chapterNo,
                      Provider.of<GeneralUpdates>(context, listen:false).page,
                      Provider.of<ChapterArguments>(context,listen: false).title.toString(),
                      Provider.of<BookArguments>(context,listen: false).author.toString(),
                      Provider.of<BookArguments>(context,listen: false).chapters.length,
                      Provider.of<BookArguments>(context,listen: false).bookCover.toString());
                      
// void setLastLeftOffPoint(
//       {required Book book,
//       required int chapterNo,
//       required int pageNo,
//       required PageReadingArguments args}) async {
//     SharedPreferences _pref = await SharedPreferences.getInstance();
//     final lastPoint = SharedPre(
//         bookTitle: book.title,
//         bookAuthor: book.author,
//         chapterNo: chapterNo,
//         totalChapters: book.chapters.length,
//         bookCover: book.bookCover,
//         pageNo: pageNo);
//     args.onLastPointChanged(lastPoint);

//     _pref.setString("lastPoint", jsonEncode(lastPoint.toJson()));

                  },
                  children:  Provider.of<ChapterArguments>(context).pages
                      .map((page) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Provider.of<ChapterArguments>(context).pages[0],
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
              child: Text('${Provider.of<GeneralUpdates>(context).page}/${Provider.of<ChapterArguments>(context).pages.length}',
                  style: GoogleFonts.poppins(fontSize: 21)),
            ),
          ],
        ),
      )),
    );
  }
}
