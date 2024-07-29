import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pixabay_gallery/providers/gallery_provider.dart';
import 'package:pixabay_gallery/screens/gallery_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GalleryProvider(),
      child: MaterialApp(
        title: 'Pixabay Gallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GalleryScreen(),
      ),
    );
  }
}
