import 'package:flutter/material.dart';
import 'package:recepia/ui/images.dart';

class FoodCategoryView extends StatelessWidget {
  const FoodCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> foodType = ["Breakfast", "Lunch", "Dinner", "Dessert"];
    List<String> foodImage = [
      Png.cereal,
      Png.bread_butter,
      Png.omlette,
      Png.tea_cookies
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 24,
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
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: foodType.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) => Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      foodImage[i],
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      foodType[i],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
