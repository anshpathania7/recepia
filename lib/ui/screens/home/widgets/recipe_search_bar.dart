import 'package:flutter/material.dart';

class RecipeSearchBar extends StatelessWidget {
  final Function() performSearch;
  final ValueChanged<String> onChanged;
  const RecipeSearchBar(
      {super.key, required this.performSearch, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (val) {
        onChanged(val);
      },
      onEditingComplete: () {
        performSearch();
      },
      decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: performSearch,
          ),
          suffixIcon: const Icon(Icons.filter_list_outlined),
          hintText: "Type ingredients comma separated",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
