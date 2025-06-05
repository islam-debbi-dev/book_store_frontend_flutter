// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      cover: json['cover'] as String?,
      iV: (json['iV'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'price': instance.price,
      'cover': instance.cover,
      'iV': instance.iV,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
