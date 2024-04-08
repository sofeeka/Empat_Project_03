import 'package:empat_project_03/widgets/book_card/book_card.dart';
import 'package:empat_project_03/Library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getBookCards(Provider.of<LibraryModel>(context)),
    );
  }

  static List<BookCard> getBookCards(LibraryModel library) {
    var result = <BookCard>[];

    for (int i = 0; i < library.books.length; i++) {
      result.add(BookCard(book: library.books.elementAt(i)));
    }

    return result;
  }
}
