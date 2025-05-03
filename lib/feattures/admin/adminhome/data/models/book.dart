import 'author.dart';

import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';

@JsonSerializable()
class Book {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  Author? author;
  String? description;
  int? price;
  String? cover;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Book(
      {this.id,
      this.title,
      this.author,
      this.description,
      this.price,
      this.cover,
      this.iV,
      this.createdAt,
      this.updatedAt});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
