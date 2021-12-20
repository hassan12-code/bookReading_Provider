import 'package:book_reading/providers/lastPoint_provider.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContinueReading extends StatelessWidget {
  const ContinueReading({
    Key? key,
  }) : super(key: key);


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
                          Provider.of<lastPoint>(context).title.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                          ),
                        ),
                         Text(Provider.of<lastPoint>(context).author.toString()),
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
                         
                            Text('Page: ${Provider.of<lastPoint>(context).pageNo}'),
                            Text(
                             
                                 'Chapter ${Provider.of<lastPoint>(context).chapterNo} of ${Provider.of<lastPoint>(context).totalChapters}'),
                          ],
                        )
                      ],
                    ),
                    BookCover(
                      key: Key("12"),
 
                      bookCover: Provider.of<lastPoint>(context).bookCover.toString(),
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
