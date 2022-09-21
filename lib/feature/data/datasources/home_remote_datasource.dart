import 'dart:convert';
import 'package:finam_test_app/core/error/exception.dart';
import 'package:finam_test_app/feature/data/models/home_data_model.dart';
import 'package:finam_test_app/feature/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource {
  Future<HomeDataModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  final url = 'https://www.reddit.com/r/flutterdev/new.json';

  @override
  Future<HomeDataModel> getHomeData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return HomeDataModel(posts: (result['data']['children'] as List).map((post) => PostModel.fromJson(post['data'])).toList());
    } else {
      throw ServerException();
    }
  }
}
