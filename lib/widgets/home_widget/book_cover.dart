import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    Key? key,
    required this.bookCover,
    this.height = 70,
    this.width = 70,
    this.fit,
  }) : super(key: key);

  final String bookCover;
  final double height;
  final double width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(bookCover),
      fit: fit,
      height: height,
      width: width,
    );
  }
}
