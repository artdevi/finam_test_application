// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      title: json['title'] as String,
      author: json['author'] as String,
      thumbnail: json['thumbnail'] as String,
      ups: json['ups'] as int,
      selftext: json['selftext'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'thumbnail': instance.thumbnail,
      'ups': instance.ups,
      'selftext': instance.selftext,
      'url': instance.url,
    };
