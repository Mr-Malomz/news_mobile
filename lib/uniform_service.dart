import 'package:dio/dio.dart';
import 'package:news_mobile/utils.dart';

class UniformService {
  final dio = Dio();
  static const _apiKey = "REPLACE WITH API KEY";
  static const _projectID = "REPLACE WITH PROJECT ID";
  static const _slug = "newsMobile";

  var headers = {
    "content-type": "application/json",
    "x-api-key": _apiKey,
  };

  Future<RootComposition> getNews() async {
    var response = await dio.get(
      "https://uniform.app/api/v1/canvas?limit=100&projectId=$_projectID&slug=$_slug",
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      var resp = response.data;
      var news = RootComposition.fromJson(resp);
      return news;
    } else {
      throw Exception('Error getting news');
    }
  }
}
