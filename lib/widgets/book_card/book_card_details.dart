import 'package:empat_project_03/Book.dart';
import 'package:empat_project_03/widgets/book_card/book_card_rating.dart';
import 'package:empat_project_03/themes/paddings.dart';
import 'package:flutter/material.dart';
import 'package:empat_project_03/themes/colors.dart';

class BookCardDetails extends StatefulWidget {
  const BookCardDetails({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  State<BookCardDetails> createState() => _BookCardDetailsState();
}

class _BookCardDetailsState extends State<BookCardDetails> {

  void onRatingChanged(int newRating) {
    setState(() {
      widget.book.rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: bigPadding,
          ),
          Text(
            widget.book.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: bigPadding,
          ),
          Text(
            'by ${widget.book.author}',
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
                color: bookCardButtonColor[widget.book.rating ?? 0],
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
          BookCardRating(
            initialRating: widget.book.rating ?? 0,
            onRatingChanged: onRatingChanged,
          ),
        ],
      ),
    );
  }
}
