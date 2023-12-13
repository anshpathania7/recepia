import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recepia/provider/search_recipe_type_provider.dart';

import 'meal_details.dart';

class SearchRecipeTypeScreen extends StatelessWidget {
  final String type;
  const SearchRecipeTypeScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            SearchRecipeTypeProvider(searchValue: type)..init(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Recipes Found are "),
            ),
            extendBodyBehindAppBar: true,
            body: Consumer<SearchRecipeTypeProvider>(
                builder: (context, state, child) {
              return state.data == null
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      child: ListView.builder(
                          itemCount: state.data!.results.length,
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
                                          state.data!.results[i].id.toString(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Card(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            state.data!.results[i].image!),
                                      ),
                                      title:
                                          Text(state.data!.results[i].title!),
                                    ),
                                  ),
                                ),
                              )),
                    );
            }),
          );
        });
  }
}
