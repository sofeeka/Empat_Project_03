import 'package:empat_project_03/Book.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final Book book;

  static const double bigPadding = 15.0;
  static const double smallPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(bigPadding, bigPadding, bigPadding, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 0.5),
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes the shadow direction
            ),
          ],
        ),
        child: SizedBox(
          height: 200,
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
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
              ),
              Expanded(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
