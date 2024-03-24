import 'package:empat_project_03/Book.dart';

class Library {
  static List<Book> getBooks() {
    var books = <Book>[];

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
          'https://static.bookcity.pl/bigcovers/1/3/8/4/9781408891384.jpg',
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
      filePath: 'https://www.gutenberg.org/files/1342/1342-h/images/cover.jpg',
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

    books.add(b1);
    books.add(b2);
    books.add(b3);
    books.add(b4);
    books.add(b5);
    books.add(b6);

    return books;
  }
}
