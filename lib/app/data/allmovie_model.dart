import 'package:cloud_firestore/cloud_firestore.dart';

class AllMovie {
  String? title;
  String? sinopsis;
  String? genre;
  double? rating;
  String? image;

  AllMovie({this.title, this.sinopsis, this.genre, this.rating, this.image});

  AllMovie.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    title = json['title'];
    sinopsis = json['sinopsis'];
    genre = json['genre'];
    rating = double.parse(json['rating'].toString());
    image = json['image'];
  }
}
