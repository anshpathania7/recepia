import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recepia/provider/search_ingredient_provider.dart';

import 'meal_details.dart';

class SearchIngredientsScreen extends StatelessWidget {
  final String searchValue;
  const SearchIngredientsScreen({super.key, required this.searchValue});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            SearchIngredientProvider(searchValue: searchValue)..init(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Recipes Found are "),
            ),
            extendBodyBehindAppBar: true,
            body: Consumer<SearchIngredientProvider>(
                builder: (context, state, child) {
              return state.data == null
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: state.data!.meals!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) => InkWell(
                                onTap: () {
                                  showBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    elevation: 4,
                                    builder: (context) => MealDetailsScreen(
                                      recipeID:
                                          state.data!.meals![i].id.toString(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        state.data!.meals![i].image!),
                                  ),
                                  title: Text(state.data!.meals![i].title!),
                                  subtitle: Text(
                                      state.data!.meals![i].likes.toString()),
                                ),
                              )),
                    );
            }),
          );
        });
  }
}
