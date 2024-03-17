import 'package:empat_project_03/BookCard.dart';
import 'package:empat_project_03/Library.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getBookCards(),
    );
  }

  static List<BookCard> getBookCards() {
    var result = <BookCard>[];

    var books = Library.getBooks();
    for (int i = 0; i < books.length; i++) {
      result.add(BookCard(book: books.elementAt(i)));
    }

    return result;
  }
}
