import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recepia/provider/home_provider.dart';

import 'widgets/food_category_view.dart';
import 'widgets/greeting_textview.dart';
import 'widgets/recipe_search_bar.dart';
import 'widgets/recommended_dishes_view_.dart';
import 'widgets/search_ingredients.dart';
import 'widgets/search_recipe_type.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const GreetingTextView(),
                const SizedBox(height: 10),
                RecipeSearchBar(
                  onChanged: (val) {
                    provider.updateCurrentSearch = val;
                  },
                  performSearch: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => SearchIngredientsScreen(
                        searchValue: provider.currentSearch,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                FoodCategoryView(
                  currentSelectedType: (s) async {
                    await showDialog(
                      context: context,
                      builder: (context) => SearchRecipeTypeScreen(
                        type: s,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                if (provider.randomMeals == null) ...[
                  const CircularProgressIndicator()
                ] else ...[
                  RecommendedDishesView(
                    data: provider.randomMeals!,
                  )
                ],
              ],
            ),
          ),
        );
      }),
    );
  }
}
