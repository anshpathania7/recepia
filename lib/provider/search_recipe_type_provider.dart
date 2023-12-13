import 'package:flutter/foundation.dart';
import 'package:recepia/models/recipe_by_type_model.dart';
import 'package:recepia/repository/api.dart';

class SearchRecipeTypeProvider extends ChangeNotifier {
  final String searchValue;
  RecipesBytypeModel? data;
  //
  final Api _api = Api();

  SearchRecipeTypeProvider({required this.searchValue});
  void init() async {
    data = await _api.searchByType(searchValue);

    notifyListeners();
  }
}
