import 'package:dio/dio.dart';
import 'package:recepia/constants.dart';
import 'package:recepia/models/meal_details_model.dart';
import 'package:recepia/models/recipe_model.dart';

//import 'test_data.dart';

class Api {
  String? url;
  BaseOptions? baseOptions;
  Dio? dio;

  Api() {
    url = "https://api.spoonacular.com/";
    baseOptions = BaseOptions(
      baseUrl: url!,
    );
    dio = Dio(baseOptions);
  }

  Future<MealByIngredientsDetailsModel> searchByIngredient(String name) async {
    final req = await dio!.get(
      'recipes/findByIngredients',
      queryParameters: {
        "apiKey": api_key,
        "ingredients": name,
      },
    );

    //final data = find_by_ingredeints;

    return MealByIngredientsDetailsModel.fromJson(req.data);
  }

  Future<RecipeDetail> getMealDetailsByIDEndpoint(String id) async {
    final req = await dio!.get(
      'recipes/$id/information',
      queryParameters: {
        "apiKey": api_key,
      },
    );

    //final data = meal_information;

    return RecipeDetail.fromJson(req.data);
  }

  Future<MealsRandomDetailsModel> getRandomMealEndpoint() async {
    final req = await dio!.get(
      'recipes/random',
      queryParameters: {
        "apiKey": api_key,
        'number': '4',
      },
    );

    // final data = {
    //   "recipes": [
    //     meal_information,
    //     meal_information,
    //     meal_information,
    //     meal_information
    //   ],
    // };

    return MealsRandomDetailsModel.fromJson(req.data);
  }
}
