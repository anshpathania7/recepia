import 'package:flutter/material.dart';
import 'package:recepia/models/meal_details_model.dart';
import 'package:recepia/ui/widgets/youtube_player.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetailsScreen extends StatelessWidget {
  final MealDetailsModel data;
  const MealDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  data.meals!.first.strMealThumb!,
                  height: 400,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 50,
                left: 24,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    color: Colors.white,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.meals!.first.strMeal!,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Category : ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Chip(
                      label: Text(
                        data.meals!.first.strCategory!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.purple,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      ", Area : ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Chip(
                      label: Text(
                        data.meals!.first.strArea!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.purple,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Flexible(
                  child: Wrap(children: [
                    for (int i = 0;
                        i < data.meals!.first.getIngredientsList().length;
                        i++) ...[
                      Chip(
                        label: Text(
                          data.meals!.first.getIngredientsList()[i]!,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.lightBlue,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ]
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Instructions",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  data.meals!.first.strInstructions!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Center(
              child: TextButton(
                onPressed: () async {
                  final Uri url = Uri.parse(data.meals!.first.strYoutube!);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "Click here to open youtube",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          CustomYoutubePlayer(
            youtubeUrl: data.meals!.first.strYoutube!,
          )
        ],
      ),
    );
  }
}
