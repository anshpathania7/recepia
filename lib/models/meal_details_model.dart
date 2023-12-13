import 'recipe_model.dart';

class MealByIngredientsDetailsModel {
  List<Recipe>? meals;

  MealByIngredientsDetailsModel({this.meals});

  MealByIngredientsDetailsModel.fromJson(List<Map<String?, dynamic>> json) {
    meals = <Recipe>[];
    for (var v in json) {
      meals!.add(Recipe.fromJson(v));
    }
  }
}

class MealsRandomDetailsModel {
  List<RecipeDetail>? meals;

  MealsRandomDetailsModel({this.meals});

  MealsRandomDetailsModel.fromJson(Map<String?, dynamic> json) {
    if (json['recipes'] != null) {
      meals = <RecipeDetail>[];
      json['recipes'].forEach((v) {
        meals!.add(RecipeDetail.fromJson(v));
      });
    }
  }
}

class Recipe {
  final num? id;
  final String? image;
  final String? imageType;
  final num? likes;
  final num? missedIngredientCount;
  final List<Ingredient>? missedIngredients;
  final String? title;
  final List<Ingredient>? unusedIngredients;
  final num? usedIngredientCount;
  final List<Ingredient>? usedIngredients;

  Recipe({
    required this.id,
    required this.image,
    required this.imageType,
    required this.likes,
    required this.missedIngredientCount,
    required this.missedIngredients,
    required this.title,
    required this.unusedIngredients,
    required this.usedIngredientCount,
    required this.usedIngredients,
  });

  factory Recipe.fromJson(Map<String?, dynamic> json) {
    return Recipe(
      id: json['id'],
      image: json['image'],
      imageType: json['imageType'],
      likes: json['likes'],
      missedIngredientCount: json['missedIngredientCount'],
      missedIngredients: List<Ingredient>.from(
        json['missedIngredients'].map(
          (ingredient) => Ingredient.fromJson(ingredient),
        ),
      ),
      title: json['title'],
      unusedIngredients: List<Ingredient>.from(
        json['unusedIngredients'].map(
          (ingredient) => Ingredient.fromJson(ingredient),
        ),
      ),
      usedIngredientCount: json['usedIngredientCount'],
      usedIngredients: List<Ingredient>.from(
        json['usedIngredients'].map(
          (ingredient) => Ingredient.fromJson(ingredient),
        ),
      ),
    );
  }
}

class Ingredient {
  final String? aisle;
  final double? amount;
  final num? id;
  final String? image;
  final List<dynamic>? meta;
  final String? name;
  final String? original;
  final String? originalName;
  final String? unit;
  final String? unitLong;
  final String? unitShort;

  Ingredient({
    required this.aisle,
    required this.amount,
    required this.id,
    required this.image,
    required this.meta,
    required this.name,
    required this.original,
    required this.originalName,
    required this.unit,
    required this.unitLong,
    required this.unitShort,
  });

  factory Ingredient.fromJson(Map<String?, dynamic> json) {
    return Ingredient(
      aisle: json['aisle'],
      amount: json['amount'].toDouble(),
      id: json['id'],
      image: json['image'],
      meta: List<dynamic>.from(json['meta']),
      name: json['name'],
      original: json['original'],
      originalName: json['originalName'],
      unit: json['unit'],
      unitLong: json['unitLong'],
      unitShort: json['unitShort'],
    );
  }
}
