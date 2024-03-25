import 'dart:async';

import 'package:empat_project_03/Book.dart';
import 'package:empat_project_03/Library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:empat_project_03/paddings/paddings.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<StatefulWidget> createState() => _MyBooks();
}

class _MyBooks extends State<MyBooks> {
  var books = Library.getBooks();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(smallPadding),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: books.length * 10,
        itemBuilder: (BuildContext context, int index) {
          return MyItemWidget(book: books.elementAt(index % books.length));
        },
        staggeredTileBuilder: (int index) {
          return const StaggeredTile.fit(1);
        },
        mainAxisSpacing: smallPadding,
        crossAxisSpacing: smallPadding,
      ),
    );
  }
}

class MyItemWidget extends StatelessWidget {
  final Book book;

  const MyItemWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getImageSize(),
      builder: (context, AsyncSnapshot<Size> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return Container();
        }

        double aspectRatio = snapshot.data!.width / snapshot.data!.height;
        double height = MediaQuery.of(context).size.width / 2 / aspectRatio;

        return Container(
          height: height,
          child: Image.network(
            book.filePath,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Future<Size> _getImageSize() async {
    Completer<Size> completer = Completer<Size>();
    Image image = Image.network(book.filePath);

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (info, _) {
          completer.complete(
            Size(
              info.image.width.toDouble(),
              info.image.height.toDouble(),
            ),
          );
        },
      ),
    );

    return completer.future;
  }
}
