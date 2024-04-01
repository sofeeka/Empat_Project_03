import 'package:flutter/material.dart';
import 'package:empat_project_03/themes/colors.dart';

class BookCardRating extends StatefulWidget {
  final int initialRating;
  final void Function(int) onRatingChanged;

  const BookCardRating(
      {super.key, required this.initialRating, required this.onRatingChanged});

  @override
  State<BookCardRating> createState() => _BookCardRatingState();
}

class _BookCardRatingState extends State<BookCardRating> {
  late int rating;

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating;
  }

  void updateRating(int newRating) {
    setState(() {
      rating = newRating;
    });
    widget.onRatingChanged(newRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating == 0 ? 'Rate this book: ' : 'Rating: ',
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        ...List.generate(
          5,
          (index) => GestureDetector(
            onTap: () => updateRating(index + 1),
            child: Icon(
              Icons.star,
              size: 13,
              color: index < rating ? bookCardButtonColor[rating] : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}