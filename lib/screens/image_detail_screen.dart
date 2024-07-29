import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pixabay_gallery/models/image_model.dart';

class ImageDetailScreen extends StatelessWidget {
  final ImageModel image;

  ImageDetailScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Text('Назад'),
          onPressed: () => Navigator.pop(context),
        ),
        leadingWidth: 100,
      ),
      body: Center(
        child: Hero(
          tag: image.id,
          child: CachedNetworkImage(
            imageUrl: image.largeImageURL,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Text('Ошибка'),
          ),
        ),
      ),
    );
  }
}
