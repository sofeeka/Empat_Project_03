import 'package:empat_project_03/Book.dart';
import 'package:flutter/material.dart';
import 'paddings.dart';

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
          SizedBox(
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
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: bigPadding,
                ),
                Text(
                  book.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: bigPadding,
                ),
                Text(
                  'by ${book.author}',
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: bigPadding,
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 71, 170, 113),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 2 * smallPadding),
                        Column(
                          children: [
                            SizedBox(height: smallPadding),
                            Text(
                              'Want to Read',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: smallPadding),
                          ],
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: bigPadding),
                const Row(
                  children: [
                    Text(
                      'Rate this book: ',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(Icons.star, size: 15, color: Colors.blueGrey),
                    Icon(Icons.star, size: 15, color: Colors.blueGrey),
                    Icon(Icons.star, size: 15, color: Colors.blueGrey),
                    Icon(Icons.star, size: 15, color: Colors.blueGrey),
                    Icon(Icons.star, size: 15, color: Colors.blueGrey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}