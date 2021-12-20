import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.42,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth(context) * 0.4,
                    child: Text(
                      book.title,
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: screenWidth(context) * 0.32,
                            child: Text(
                              book.details,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: screenWidth(context) * 0.3,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text('Read'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Rating(rating: book.rating)
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                BookCover(
                  bookCover: book.bookCover,
                  height: screenHeight(context) * 0.25,
                  width: screenWidth(context) * 0.25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
