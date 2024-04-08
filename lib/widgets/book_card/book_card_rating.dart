import 'package:flutter/material.dart';
import 'package:empat_project_03/themes/colors.dart';
import 'package:provider/provider.dart';

import '../../Book.dart';
import '../../Library.dart';

class BookCardRating extends StatelessWidget {
  final String bookId;
  final int initialRating;

  const BookCardRating({
    super.key,
    this.initialRating = 0,
    required this.bookId,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LibraryModel>(
      builder: (context, library, child) {
        final book = library.books.firstWhere(
          (book) => book.id == bookId,
          orElse: () => Book(
            id: 'defaultId',
            name: 'Default Book',
            author: 'Unknown',
            genre: 'Unknown',
            filePath: 'https://nebulae-assets.s3.amazonaws.com/3b56d17152bd46c295797a7eaab1f244.jpg',
          ),
        );

        return Row(
          children: [
            Text(
              book.rating == 0 ? 'Rate this book: ' : 'Rating: ',
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            ...List.generate(
              5,
              (index) => GestureDetector(
                onTap: () => library.updateRating(book, (index + 1)),
                child: Icon(
                  Icons.star,
                  size: 13,
                  color: index < (book.rating ?? 0)
                      ? bookCardButtonColorList[(book.rating ?? 0)]
                      : Colors.grey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
