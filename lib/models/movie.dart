import 'dart:convert';

class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.imageURL,
    required this.rating,
  });

  final int id;
  final String title;
  final String? description;
  final String? imageURL;
  final double? rating;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imageURL': imageURL,
      'rating': rating,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      imageURL: map['imageURL'] != null ? map['imageURL'] as String : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
