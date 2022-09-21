import 'package:finam_test_app/feature/domain/entities/home_data_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends PostEntity {
  PostModel({
    required super.title,
    required super.author,
    required super.thumbnail,
    required super.ups,
    required super.selftext,
    required super.url,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
