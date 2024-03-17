import 'package:flutter/material.dart';

class BookCardRating extends StatelessWidget {
  const BookCardRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}