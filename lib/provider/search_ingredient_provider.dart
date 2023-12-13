import 'package:flutter/material.dart';
import 'package:recepia/models/meal_details_model.dart';
import 'package:recepia/repository/api.dart';

class SearchIngredientProvider extends ChangeNotifier {
  final String searchValue;
  MealByIngredientsDetailsModel? data;
  //
  final Api _api = Api();

  SearchIngredientProvider({required this.searchValue});
  void init() async {
    data = await _api.searchByIngredient(searchValue);

    notifyListeners();
  }
}
