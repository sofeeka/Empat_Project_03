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
          BookCardImage(book: book, width: 110,),
          BookCardDetails(book: book),
        ],
      ),
    );
  }
}