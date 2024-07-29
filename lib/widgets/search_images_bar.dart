import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pixabay_gallery/providers/gallery_provider.dart';

class SearchImagesBar extends StatefulWidget {
  const SearchImagesBar();
  @override
  _SearchImagesBarState createState() => _SearchImagesBarState();
}

class _SearchImagesBarState extends State<SearchImagesBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      Provider.of<GalleryProvider>(context, listen: false)
          .fetchImages(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) => _onSearchChanged(),
      decoration: InputDecoration(
        hintText: 'Search images...',
        border: OutlineInputBorder(),
      ),
    );
  }
}
