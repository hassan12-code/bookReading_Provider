import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueReading extends StatelessWidget {
  const ContinueReading({
    Key? key,
    required this.lastPoint,
  }) : super(key: key);

  final LastPoint lastPoint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Continue Reading",
            style: GoogleFonts.poppins(
              fontSize: 17,
            )),
        SizedBox(height: 20),
        Container(
          width: screenWidth(context) * 0.9,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lastPoint.bookTitle,
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                          ),
                        ),
                        Text(lastPoint.bookAuthor),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Page: ${lastPoint.pageNo}'),
                            Text(
                                'Chapter ${lastPoint.chapterNo} of ${lastPoint.totalChapters}'),
                          ],
                        )
                      ],
                    ),
                    BookCover(
                      key: Key("12"),
                      bookCover: lastPoint.bookCover,
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
