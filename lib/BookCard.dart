import 'package:empat_project_03/Book.dart';
import 'package:empat_project_03/BookCard.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final Book book;

  static const bool showThickBorders = false;
  static const double padding = 15.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(padding, padding, padding, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: showThickBorders ? Colors.black : Colors.black26,
              width: showThickBorders ? 2 : 0.5),
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
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: BookCover(book: book),
              ),
              const Expanded(
                flex: 2,
                child: Column(
                  children: [

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}