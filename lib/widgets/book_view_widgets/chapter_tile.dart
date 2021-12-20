import 'package:book_reading/models/user.dart';
import 'package:book_reading/providers/ChapterArguments_provider.dart';
import 'package:book_reading/providers/generalUpdates_provider.dart';
import 'package:book_reading/screens/page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChapterTile extends StatelessWidget {
  const ChapterTile({
    Key? key,
    required this.chapter,
    required this.book,
  }) : super(key: key);

  final Chapter chapter;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Provider.of<ChapterArguments>(context, listen: false).setValues(chapter.title, chapter.description, chapter.pages, chapter.chapterNo, book);
          Provider.of<GeneralUpdates>(context,listen: false).updates(1);
          Navigator.of(context).pushNamed(
            PageReading.routeName,
          );
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          shadowColor: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chapter ${chapter.chapterNo} : ${chapter.title}",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      chapter.description,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
