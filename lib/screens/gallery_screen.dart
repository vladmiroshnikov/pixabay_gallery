import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pixabay_gallery/providers/gallery_provider.dart';
import 'package:pixabay_gallery/widgets/image_grid.dart';
import 'package:pixabay_gallery/widgets/search_images_bar.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!kDebugMode) context.read<GalleryProvider>().fetchImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixabay Gallery'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchImagesBar(),
          ),
        ),
      ),
      body: Consumer<GalleryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.images.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return NotificationListener(
            onNotification: (ScrollNotification scrollInfo) {
              if (!provider.isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                provider.fetchImages(provider.query);
              }
              return false;
            },
            child: ImageGrid(images: provider.images),
          );
        },
      ),
    );
  }
}
