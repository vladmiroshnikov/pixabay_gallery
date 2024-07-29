class ImageModel {
  final String id;
  final String previewURL;
  final String largeImageURL;
  final int likes;
  final int views;

  ImageModel({
    required this.id,
    required this.previewURL,
    required this.largeImageURL,
    required this.likes,
    required this.views,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'].toString(),
      previewURL: json['previewURL'],
      largeImageURL: json['largeImageURL'],
      likes: json['likes'],
      views: json['views'],
    );
  }
}
