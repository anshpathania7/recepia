// ignore_for_file: non_constant_identifier_names

class Png {
  static String _generateFoodAssetPath(String name) => "assets/food/$name.jpg";

  static String bread_butter = _generateFoodAssetPath("bread_butter");
  static String cereal = _generateFoodAssetPath("cereal");
  static String tea_cookies = _generateFoodAssetPath("tea_cookies");
  static String omlette = _generateFoodAssetPath("omlette");
}
