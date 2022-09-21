import 'package:finam_test_app/feature/data/models/post_model.dart';
import 'package:finam_test_app/feature/domain/entities/home_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel extends HomeDataEntity {
  HomeDataModel({
    required List<PostModel> posts,
  }) : super(posts: posts);

  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);
}
