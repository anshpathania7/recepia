import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recepia/provider/home_provider.dart';
import 'package:recepia/ui/screens/home/widgets/greeting_textview.dart';

import 'widgets/food_category_view.dart';
import 'widgets/recipe_search_bar.dart';
import 'widgets/recommended_dishes_view_.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const GreetingTextView(),
                const SizedBox(height: 10),
                const RecipeSearchBar(),
                const SizedBox(height: 20),
                const FoodCategoryView(),
                const SizedBox(height: 20),
                if (provider.randomMeals.isEmpty) ...[
                  const CircularProgressIndicator()
                ] else ...[
                  RecommendedDishesView(
                    data: provider.randomMeals,
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
