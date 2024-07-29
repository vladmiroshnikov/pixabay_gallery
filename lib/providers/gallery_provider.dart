import 'package:flutter/foundation.dart';
import 'package:pixabay_gallery/models/image_model.dart';
import 'package:pixabay_gallery/services/api_service.dart';

class GalleryProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<ImageModel> _images = [];
  int _page = 1;
  bool _isLoading = false;
  String _query = '';

  String get query => _query;
  List<ImageModel> get images => _images;
  bool get isLoading => _isLoading;

  Future<void> fetchImages([String? newQuery]) async {
    final query = newQuery ?? _query;

    if (_query != query) {
      _query = query;
      _page = 1;
      _images = [];
    }

    _isLoading = true;
    notifyListeners();

    final newImages = await _apiService.fetchImages(query, _page);
    _images.addAll(newImages);
    _page++;

    _isLoading = false;
    notifyListeners();
  }
}
