import 'package:empat_project_03/Book.dart';
import 'package:flutter/material.dart';
import 'paddings.dart';

class BookCardHeader extends StatelessWidget {
  const BookCardHeader({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.only(
          top: smallPadding,
          left: 2 * smallPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('New Releases in'),
            const SizedBox(
              width: smallPadding,
            ),
            Text(
              book.genre,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 99, 94),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
