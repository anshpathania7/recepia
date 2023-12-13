import 'dart:convert';

class RecipesBytypeModel {
  num? offset;
  num? number;
  List<RecipeBytypeModel> results;
  num? totalResults;

  RecipesBytypeModel({
    required this.offset,
    required this.number,
    required this.results,
    required this.totalResults,
  });

  factory RecipesBytypeModel.fromJson(String json) =>
      RecipesBytypeModel.fromMap(jsonDecode(json));

  factory RecipesBytypeModel.fromMap(Map<String?, dynamic> map) =>
      RecipesBytypeModel(
        offset: map['offset'],
        number: map['number'],
        results: List<RecipeBytypeModel>.from(
            map['results'].map((x) => RecipeBytypeModel.fromMap(x))),
        totalResults: map['totalResults'],
      );

  String? toJson() => jsonEncode(toMap());

  Map<String?, dynamic> toMap() => {
        'offset': offset,
        'number': number,
        'results': List<dynamic>.from(results.map((x) => x.toMap())),
        'totalResults': totalResults,
      };
}

class RecipeBytypeModel {
  num? id;
  String? title;
  String? image;
  String? imageType;

  RecipeBytypeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  factory RecipeBytypeModel.fromJson(String json) =>
      RecipeBytypeModel.fromMap(jsonDecode(json));

  factory RecipeBytypeModel.fromMap(Map<String?, dynamic> map) =>
      RecipeBytypeModel(
        id: map['id'],
        title: map['title'],
        image: map['image'],
        imageType: map['imageType'],
      );

  String? toJson() => jsonEncode(toMap());

  Map<String?, dynamic> toMap() => {
        'id': id,
        'title': title,
        'image': image,
        'imageType': imageType,
      };
}
