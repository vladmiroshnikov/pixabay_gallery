import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pixabay_gallery/models/image_model.dart';

class ApiService {
  static const String _apiKey = '45176675-9ad6fa2b1916533b8be0ef589';
  static const String _baseUrl = 'https://pixabay.com/api/';

  Future<List<ImageModel>> fetchImages(String query, int page) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?key=$_apiKey&q=$query&page=$page&image_type=photo'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<ImageModel> images = (data['hits'] as List)
          .map((json) => ImageModel.fromJson(json))
          .toList();
      return images;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
