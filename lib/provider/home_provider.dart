import 'package:flutter/material.dart';
import 'package:recepia/models/meal_details_model.dart';
import 'package:recepia/repository/api.dart';

class HomeProvider extends ChangeNotifier {
  List<String> ingredientsToSearch = [];
  String _currentSearch = "";

  set updateCurrentSearch(String s) {
    _currentSearch = s;
    notifyListeners();
  }

  get currentSearch => _currentSearch;

  //
  final Api _api = Api();
  MealsRandomDetailsModel? randomMeals;
  void init() async {
    ingredientsToSearch = List.empty(growable: true);

    randomMeals = await _api.getRandomMealEndpoint();

    notifyListeners();
  }
}
