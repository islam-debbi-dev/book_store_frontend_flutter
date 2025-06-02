import 'package:json_annotation/json_annotation.dart';
part 'author.g.dart';

@JsonSerializable()
class Author {
  @JsonKey(name: '_id')
  String? id;
  // @JsonKey(name: 'firstname')
  String? firstName;
  String? lastName;
  String? nationality;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Author({
    this.id,
    this.firstName,
    this.lastName,
    this.nationality,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
