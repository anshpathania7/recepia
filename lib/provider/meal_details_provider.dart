import 'package:flutter/material.dart';
import 'package:recepia/models/recipe_model.dart';
import 'package:recepia/repository/api.dart';

class MealDetailsProvider extends ChangeNotifier {
  List<String> ingredientsToSearch = [];
  //
  final Api _api = Api();
  RecipeDetail? meal;
  void init(String id) async {
    ingredientsToSearch = List.empty(growable: true);

    meal = await _api.getMealDetailsByIDEndpoint(id);

    notifyListeners();
  }
}
