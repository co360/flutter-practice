import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/models/http_exception.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorited;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorited = false,
  });

  void _setFav(bool favStatus) {
    isFavorited = favStatus;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isFavorited;

    final url =
        'https://flutter-shop-app-114ec.firebaseio.com/products/$id.json';

    _setFav(!isFavorited);
    final response = await http.patch(url,
        body: json.encode({
          'isFavorited': isFavorited,
        }));
    if (response.statusCode >= 400) {
      _setFav(oldStatus);
      throw HttpException('Could not update the item.');
    }
  }
}
