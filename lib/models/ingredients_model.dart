class Ingredient {
  String idIngredient;
  String strIngredient;
  String strDescription;
  String strType;

  Ingredient({
    required this.idIngredient,
    required this.strIngredient,
    required this.strDescription,
    required this.strType,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      idIngredient: json['idIngredient'],
      strIngredient: json['strIngredient'],
      strDescription: json['strDescription'],
      strType: json['strType'],
    );
  }
}

class IngredientsResponse {
  List<Ingredient> ingredients;

  IngredientsResponse({
    required this.ingredients,
  });

  factory IngredientsResponse.fromJson(Map<String, dynamic> json) {
    var ingredientList = json['Ingredients'] as List<dynamic>;
    List<Ingredient> ingredients =
        ingredientList.map((item) => Ingredient.fromJson(item)).toList();

    return IngredientsResponse(ingredients: ingredients);
  }
}
