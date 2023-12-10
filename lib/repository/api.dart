import 'package:dio/dio.dart';
import 'package:recepia/models/meal_details_model.dart';

class Api {
  String? url;
  BaseOptions? baseOptions;
  Dio? dio;

  Api() {
    url = "https://www.themealdb.com/api/json/v1/1/";
    baseOptions = BaseOptions(
      baseUrl: url!,
    );
    dio = Dio(baseOptions);
  }

  Future<MealDetailsModel> getSearchByMealNameEndpoint(String name) async {
    final req = await dio!.get(
      'search.php',
      queryParameters: {
        "s": name,
      },
    );
    return MealDetailsModel.fromJson(req.data as Map<String, dynamic>);
  }

  Future<MealDetailsModel> getMealDetailsByIDEndpoint(String id) async {
    final req = await dio!.get(
      'look.php',
      queryParameters: {
        "i": id,
      },
    );

    return MealDetailsModel.fromJson(req.data as Map<String, dynamic>);
  }

  Future<MealDetailsModel> getSingleRandomMealEndpoint() async {
    final req = await dio!.get(
      'random.php',
    );

    return MealDetailsModel.fromJson(req.data as Map<String, dynamic>);
  }

  String getAllIngredientsEndpoint() => "${url}list.php?i=list";
  String getAllCategoriesEndpoint() => "${url}list.php?c=list";
  String getAllAreaEndpoint() => "${url}list.php?a=list";
}
