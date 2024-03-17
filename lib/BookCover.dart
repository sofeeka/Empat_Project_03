import 'package:flutter/material.dart';
import 'Book.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(book.filePath),
        ],
      ),
    );
  }
}