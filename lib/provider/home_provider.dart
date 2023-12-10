import 'package:flutter/material.dart';
import 'package:recepia/models/meal_details_model.dart';
import 'package:recepia/repository/api.dart';

class HomeProvider extends ChangeNotifier {
  //
  final Api _api = Api();
  List<MealDetailsModel?> randomMeals = [];
  void init() async {
    final model1 = _api.getSingleRandomMealEndpoint();
    final model2 = _api.getSingleRandomMealEndpoint();
    final model3 = _api.getSingleRandomMealEndpoint();
    final model4 = _api.getSingleRandomMealEndpoint();

    randomMeals = await Future.wait([model1, model2, model3, model4]);

    notifyListeners();
  }
}
