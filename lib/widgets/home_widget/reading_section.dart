import 'package:book_reading/models/user.dart';
import 'package:book_reading/utils/utils.dart';
import 'package:book_reading/widgets/home_widget/book_cover.dart';
import 'package:book_reading/widgets/home_widget/book_information.dart';
import 'package:flutter/material.dart';
import 'package:book_reading/providers/bookCover_provider.dart';
import 'package:provider/provider.dart';

class ReadingSection extends StatelessWidget {
  ReadingSection({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Book> books;

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
            children: books.map(
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
                            ),
                        Provider.of<BookCoverClass>(context).isShowingCover
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
