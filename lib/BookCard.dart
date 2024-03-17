import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  // final Book book;

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
        child: const SizedBox(
          height: 200,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 100),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}