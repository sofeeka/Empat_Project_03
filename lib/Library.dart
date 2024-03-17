import 'dart:io';

import 'package:empat_project_03/Book.dart';

class Library
{
  static List<Book> getBooks()
  {
    var books = <Book>[];
    Book b1 = Book(
      author: 'Hanya Yanagihara',
      name: 'A Little Life',
      filePath: 'https://m.media-amazon.com/images/I/91YZIKXZ+bL._SL1500_.jpg',
      genre: 'Novel'
    );

    books.add(b1);
    books.add(b1);
    books.add(b1);
    books.add(b1);
    books.add(b1);
    books.add(b1);

    return books;
  }
}