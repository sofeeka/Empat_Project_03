import 'package:empat_project_03/Book.dart';
import 'package:flutter/material.dart';
import 'package:empat_project_03/BookCardImage.dart';
import 'package:empat_project_03/BookCardDetails.dart';

class BookCardMainBody extends StatelessWidget {
  const BookCardMainBody({
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
          BookCardImage(book: book),
          BookCardDetails(book: book),
        ],
      ),
    );
  }
}