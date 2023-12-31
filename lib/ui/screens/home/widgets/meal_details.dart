import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recepia/provider/meal_details_provider.dart';

class MealDetailsScreen extends StatelessWidget {
  final String recipeID;
  const MealDetailsScreen({super.key, required this.recipeID});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ChangeNotifierProvider(
          create: (context) => MealDetailsProvider()..init(recipeID),
          builder: (context, child) {
            return Consumer<MealDetailsProvider>(
                builder: (context, state, child) {
              return state.meal == null
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                state.meal!.image!,
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
                                state.meal!.title!,
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
                                    "Serving size : ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Chip(
                                    label: Text(
                                      state.meal!.servings.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.purple,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Time taken to Ready =>",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Chip(
                                    label: Text(
                                      "${state.meal!.readyInMinutes} minutes",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.purple,
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 12),
                                        child: Text(
                                          "Ingredients",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Wrap(children: [
                                        for (int i = 0;
                                            i <
                                                state.meal!.extendedIngredients
                                                    .length;
                                            i++) ...[
                                          Chip(
                                            label: Text(
                                              state.meal!.extendedIngredients[i]
                                                  .name!,
                                              style: const TextStyle(
                                                color: Colors.white70,
                                              ),
                                            ),
                                            backgroundColor: Colors.deepPurple,
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                        ]
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  "Instructions",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                state.meal!.summary!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Credits : ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Chip(
                                    label: Text(
                                      state.meal!.creditsText!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.purple,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            });
          }),
    );
  }
}
