import 'package:flutter/material.dart';
import 'package:recepia/models/meal_details_model.dart';

import 'meal_details.dart';

class RecommendedDishesView extends StatelessWidget {
  final MealsRandomDetailsModel data;
  const RecommendedDishesView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Recommendation",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Text(
              "See all",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
            itemCount: data.meals?.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              childAspectRatio: 0.6,
            ),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) => InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  builder: (context) => MealDetailsScreen(
                    recipeID: data.meals![i].id.toString(),
                  ),
                );
              },
              child: SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          data.meals![i].image!,
                          height: 200,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        data.meals![i].title!,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        data.meals![i].title!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
