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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => ImageDialog(
                        book: book,
                      ));
            },
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
    return Dialog(
      child: Hero(
        tag: book.id,
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(book.filePath), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
