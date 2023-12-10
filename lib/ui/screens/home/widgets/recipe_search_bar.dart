import 'package:flutter/material.dart';

class RecipeSearchBar extends StatelessWidget {
  const RecipeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.filter_list_outlined),
          hintText: "Search Any Recipe",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
