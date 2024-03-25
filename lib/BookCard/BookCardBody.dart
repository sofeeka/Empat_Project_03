import 'package:empat_project_03/Book.dart';
import 'package:flutter/material.dart';
import 'package:empat_project_03/BookCard/BookCardImage.dart';
import 'package:empat_project_03/BookCard/BookCardDetails.dart';

class BookCardBody extends StatelessWidget {
  const BookCardBody({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ImageDialog(book: book)),
            ),
            child: BookCardImage(
              book: book,
              width: 110,
            ),
          ),
          BookCardDetails(book: book),
        ],
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final Book book;

  const ImageDialog({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Hero(
          tag: book.id,
          child: Image.network(
            book.filePath,
          ),
        ),
      ),
    );
  }
}
