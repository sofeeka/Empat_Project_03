import 'package:empat_project_03/Book.dart';
import 'package:empat_project_03/widgets/book_card/book_card_header.dart';
import 'package:empat_project_03/widgets/book_card//book_card_body.dart';
import 'package:flutter/material.dart';
import 'package:empat_project_03/themes/paddings.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(bigPadding, bigPadding/2, bigPadding, bigPadding/2),
      child: Container(
        decoration: buildBoxDecorationForBookCard(),
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              BookCardHeader(book: book),
              BookCardBody(book: book),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecorationForBookCard() {
    return BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.5),
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      );
  }
}