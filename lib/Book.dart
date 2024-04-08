import 'package:flutter/material.dart';

class Book {
  final String filePath;
  final String author;
  final String name;
  final String genre;
  final String id;
  late int width;
  late int height;
  int? rating;

  Book({
    required this.filePath,
    required this.author,
    required this.name,
    required this.genre,
    required this.id,
  }){
    _calculateImageDimensions();
    rating = 0;
  }

  void _calculateImageDimensions() {
    Image image = Image.network(filePath);

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
            (ImageInfo info, bool _) {
          width = info.image.width;
          height = info.image.height;
        },
      ),
    );
  }
}