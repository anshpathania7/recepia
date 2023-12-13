import 'package:flutter/material.dart';
import 'package:recepia/ui/images.dart';

class FoodCategoryView extends StatelessWidget {
  final ValueChanged<String> currentSelectedType;
  const FoodCategoryView({super.key, required this.currentSelectedType});

  @override
  Widget build(BuildContext context) {
    List<String> foodType = ["main course", "breakfast", "snack", "appetizer"];
    List<String> foodImage = [
      Png.omlette,
      Png.cereal,
      Png.tea_cookies,
      Png.bread_butter
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Categories",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: foodType.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) => InkWell(
              onTap: () => currentSelectedType(foodType[i]),
              child: Card(
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
        ),
      ],
    );
  }
}
