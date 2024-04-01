import 'dart:async';

import 'package:empat_project_03/Book.dart';
import 'package:empat_project_03/Library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:empat_project_03/themes/paddings.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<StatefulWidget> createState() => _MyBooks();
}

class _MyBooks extends State<MyBooks> {
  var books = Library.getBooks();
  int crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    crossAxisCount = MediaQuery
        .of(context)
        .size
        .width ~/ 150;
    return Padding(
      padding: const EdgeInsets.all(smallPadding),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: crossAxisCount,
        itemCount: books.length * 10,
        itemBuilder: (BuildContext context, int index) {
          return MyItemWidget(book: books.elementAt(index % books.length),
            crossAxisCount: crossAxisCount,);
        },
        staggeredTileBuilder: (int index) {
          return const StaggeredTile.fit(1);
        },
        mainAxisSpacing: smallPadding * 1.5,
        crossAxisSpacing: smallPadding * 1.5,
      ),
    );
  }
}

class MyItemWidget extends StatelessWidget {
  final Book book;
  final int crossAxisCount;

  const MyItemWidget(
      {super.key, required this.book, required this.crossAxisCount});

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
        double width = MediaQuery.of(context).size.width / crossAxisCount;
        double height = width / aspectRatio;

        return SizedBox(
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              book.filePath,
              fit: BoxFit.cover,
            ),
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
