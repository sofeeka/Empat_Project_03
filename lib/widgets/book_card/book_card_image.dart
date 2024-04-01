import 'package:empat_project_03/Book.dart';
import 'package:empat_project_03/themes/paddings.dart';
import 'package:flutter/material.dart';

class BookCardImage extends StatelessWidget {
  final int width;

  const BookCardImage({
    super.key,
    required this.book,
    required this.width,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Padding(
        padding: const EdgeInsets.all(bigPadding),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: book.id,
                  child: Image.network(
                    book.filePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
