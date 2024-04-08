import 'package:empat_project_03/Book.dart';
import 'package:flutter/material.dart';

class LibraryModel extends ChangeNotifier {
  List<Book> books = <Book>[];

  LibraryModel() {
    initialiseBooks();
  }

  void initialiseBooks() {
    books = <Book>[];

    Book b1 = Book(
      author: 'Hanya Yanagihara',
      name: 'A Little Life',
      filePath: 'https://m.media-amazon.com/images/I/91YZIKXZ+bL._SL1500_.jpg',
      genre: 'Novel',
      id: 'id1',
    );

    Book b2 = Book(
      author: 'Madeline Miller',
      name: 'The Song of Achilles',
      filePath:
          'https://m.media-amazon.com/images/I/81msb6gUBTL._AC_UF894,1000_QL80_.jpg',
      genre: 'Greek Mythology',
      id: 'id2',
    );

    Book b3 = Book(
      author: 'Steve McConnel',
      name: 'Code Complete',
      filePath:
          'https://m.media-amazon.com/images/I/61GzazUmKyL._AC_UF1000,1000_QL80_.jpg',
      genre: 'Technology',
      id: 'id3',
    );

    Book b4 = Book(
      author: 'Jane Austin',
      name: 'Pride and Prejudice',
      filePath:
          'https://m.media-amazon.com/images/I/81RE22MUk7L._AC_UF1000,1000_QL80_.jpg',
      genre: 'Classics',
      id: 'id4',
    );

    Book b5 = Book(
      author: 'Taylor Jenkins Reid',
      name: 'The Seven Husbands of Evelyn Hugo',
      filePath:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1664458703i/32620332.jpg',
      genre: 'Novel',
      id: 'id5',
    );

    Book b6 = Book(
      author: 'Rebecca Yarros',
      name: 'Fourth Wing',
      filePath:
          'https://m.media-amazon.com/images/I/A1yI0aFggmL._AC_UF1000,1000_QL80_.jpg',
      genre: 'Fantasy',
      id: 'id6',
    );

    Book b7 = Book(
      author: 'Brandon Sanderson',
      name: 'The Way of Kings',
      filePath:
          'https://m.media-amazon.com/images/I/716RJ4qAyjL._AC_UF1000,1000_QL80_.jpg',
      genre: 'Fantasy',
      id: 'id7',
    );

    Book b8 = Book(
      author: 'Haruki Murakami',
      name: 'Norwegian Wood',
      filePath:
          'https://m.media-amazon.com/images/I/81zqVhvbHbL._AC_UF894,1000_QL80_.jpg',
      genre: 'Fiction',
      id: 'id8',
    );

    Book b9 = Book(
      author: 'J.K. Rowling',
      name: 'Harry Potter and the Philosopher\'s Stone',
      filePath:
          'https://i.pinimg.com/474x/8f/27/2b/8f272b7ebb4e7f225e373f94d43f9595.jpg',
      genre: 'Fantasy',
      id: 'id9',
    );

    Book b10 = Book(
      author: 'George Orwell',
      name: '1984',
      filePath:
          'https://m.media-amazon.com/images/I/61ZewDE3beL._AC_UF894,1000_QL80_.jpg',
      genre: 'Classic',
      id: 'id10',
    );

    Book b11 = Book(
      author: 'Agatha Christie',
      name: 'Murder on the Orient Express',
      filePath:
          'https://m.media-amazon.com/images/I/81gkOWZnIqL._AC_UF1000,1000_QL80_.jpg',
      genre: 'Mystery',
      id: 'id12',
    );

    books.add(b1);
    books.add(b2);
    books.add(b3);
    books.add(b4);
    books.add(b5);
    books.add(b6);
    books.add(b7);
    books.add(b8);
    books.add(b9);
    books.add(b10);
    books.add(b11);
  }

  updateRating(Book book, int newRating) {
    final index = books.indexOf(book);
    if (index != -1) {
      books[index].rating = newRating;
      notifyListeners();
    }
  }
}
