import 'package:json_annotation/json_annotation.dart';

class HomeDataEntity {
  final List<PostEntity> posts;

  HomeDataEntity({
    required this.posts,
  });
}

@JsonSerializable()
class PostEntity {
  final String title;
  final String author;
  final String thumbnail;
  final int ups;
  final String selftext;
  final String url;

  PostEntity({
    required this.title,
    required this.author,
    required this.thumbnail,
    required this.ups,
    required this.selftext,
    required this.url,
  });
}
