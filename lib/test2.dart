import 'dart:convert';

class Productt {
  final int id;
  final String name;
  final String permalink;
  final String description;
  final String price;
  final List<ImageData> images;

  Productt(
      {required this.id,
      required this.name,
      required this.permalink,
      required this.description,
      required this.price,
      required this.images});

  factory Productt.fromJson(Map<String, dynamic> json) {
    var imagesList = json['images'] as List;
    List<ImageData> imagesData =
        imagesList.map((i) => ImageData.fromJson(i)).toList();

    return Productt(
      id: json['id'],
      name: json['name'],
      permalink: json['permalink'],
      description: json['description'],
      price: json['price'],
      images: imagesData,
    );
  }
}

class ImageData {
  final String src;

  ImageData({required this.src});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      src: json['src'],
    );
  }
}
