class RecipeDetail {
  final num? preparationMinutes;
  final num? cookingMinutes;
  final num? aggregateLikes;
  final num? healthScore;
  final String? creditsText;
  final String? license;
  final String? sourceName;
  final List<ExtendedIngredient> extendedIngredients;
  final num? id;
  final String? title;
  final num? readyInMinutes;
  final num? servings;
  final String? sourceUrl;
  final String? image;
  final String? imageType;
  final String? summary;

  RecipeDetail({
    required this.preparationMinutes,
    required this.cookingMinutes,
    required this.aggregateLikes,
    required this.healthScore,
    required this.creditsText,
    required this.license,
    required this.sourceName,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.image,
    required this.imageType,
    required this.summary,
  });

  factory RecipeDetail.fromJson(Map<String?, dynamic> json) {
    return RecipeDetail(
      preparationMinutes: json['preparationMinutes'],
      cookingMinutes: json['cookingMinutes'],
      aggregateLikes: json['aggregateLikes'],
      healthScore: json['healthScore'],
      creditsText: json['creditsText'],
      license: json['license'],
      sourceName: json['sourceName'],
      extendedIngredients: (json['extendedIngredients'] as List)
          .map((ingredient) => ExtendedIngredient.fromJson(ingredient))
          .toList(),
      id: json['id'],
      title: json['title'],
      readyInMinutes: json['readyInMinutes'],
      servings: json['servings'],
      sourceUrl: json['sourceUrl'],
      image: json['image'],
      imageType: json['imageType'],
      summary: json['summary'],
    );
  }
}

class ExtendedIngredient {
  final num? id;
  final String? aisle;
  final String? image;
  final String? consistency;
  final String? name;
  final String? nameClean;
  final String? original;
  final String? originalName;
  final num? amount;
  final String? unit;

  ExtendedIngredient({
    required this.id,
    required this.aisle,
    required this.image,
    required this.consistency,
    required this.name,
    required this.nameClean,
    required this.original,
    required this.originalName,
    required this.amount,
    required this.unit,
  });

  factory ExtendedIngredient.fromJson(Map<String?, dynamic> json) {
    return ExtendedIngredient(
      id: json['id'],
      aisle: json['aisle'],
      image: json['image'],
      consistency: json['consistency'],
      name: json['name'],
      nameClean: json['nameClean'],
      original: json['original'],
      originalName: json['originalName'],
      amount: json['amount'].toDouble(),
      unit: json['unit'],
    );
  }
}
