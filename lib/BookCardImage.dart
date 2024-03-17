import 'package:empat_project_03/Book.dart';
import 'package:empat_project_03/paddings.dart';
import 'package:flutter/material.dart';

class BookCardImage extends StatelessWidget {
  const BookCardImage({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Padding(
        padding: const EdgeInsets.only(
          top: bigPadding,
          right: bigPadding,
          left: bigPadding,
        ),
        child: Column(
          children: [
            Image.network(book.filePath),
          ],
        ),
      ),
    );
  }
}