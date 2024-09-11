import 'package:flutter/material.dart';
import 'package:suez_canal_assignment/core/utils/navigation_helper.dart';
import 'package:suez_canal_assignment/core/utils/routes.dart';

import '../../data/models/nutrition_detail_model.dart';

class IngredientsNutritionSummaryScreen extends StatelessWidget {
  const IngredientsNutritionSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nutritionDetail = ModalRoute.of(context)!.settings.arguments as NutritionDetailModel;

    final List<Parsed> parsedIngredients = nutritionDetail.ingredients?.expand((ingredient) => (ingredient.parsed ?? []).map((e) => e)).toList() ?? [];

    final totalCalories = parsedIngredients.fold(0, (sum, item) => sum + (item.nutrients?['ENERC_KCAL']?.quantity ?? 0).toInt());
    final totalWeight = parsedIngredients.fold(0.0, (sum, item) => sum + (item.weight ?? 0.0));

    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary Breakdown'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isPortrait ? buildPortraitLayout(context, parsedIngredients, totalCalories, totalWeight) : buildLandscapeLayout(context, parsedIngredients, totalCalories, totalWeight),
      ),
    );
  }

  Widget buildPortraitLayout(BuildContext context, List<Parsed> parsedIngredients, int totalCalories, double totalWeight) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: parsedIngredients.length,
            itemBuilder: (context, index) {
              final ingredient = parsedIngredients[index];
              return GestureDetector(
                onTap: () => context.pushNamed(totalNutritionAnalysisScreen, arguments: ingredient),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ingredient.food ?? 'Unknown Food',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Quantity: ${ingredient.quantity ?? 0} ${ingredient.measure ?? 'unit'}'),
                            Text('Calories: ${ingredient.nutrients?['ENERC_KCAL']?.quantity?.toInt() ?? 0} kcal'),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Weight: ${ingredient.weight?.toStringAsFixed(2) ?? '0'} g'),
                            Text('Unit: ${ingredient.measure ?? 'unit'}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Total Button
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Total Nutrition'),
                  content: Text('Total Calories: $totalCalories kcal\nTotal Weight: ${totalWeight.toStringAsFixed(2)} g'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Show Total Nutrition'),
          ),
        ),
      ],
    );
  }

  Widget buildLandscapeLayout(BuildContext context, List<Parsed> parsedIngredients, int totalCalories, double totalWeight) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: parsedIngredients.length,
            itemBuilder: (context, index) {
              final ingredient = parsedIngredients[index];
              return GestureDetector(
                onTap: () => context.pushNamed(totalNutritionAnalysisScreen, arguments: ingredient),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ingredient.food ?? 'Unknown Food',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Quantity: ${ingredient.quantity ?? 0} ${ingredient.measure ?? 'unit'}'),
                            Text('Calories: ${ingredient.nutrients?['ENERC_KCAL']?.quantity?.toInt() ?? 0} kcal'),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Weight: ${ingredient.weight?.toStringAsFixed(2) ?? '0'} g'),
                            Text('Unit: ${ingredient.measure ?? 'unit'}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          width: 200,
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Total Nutrition'),
                  content: Text('Total Calories: $totalCalories kcal\nTotal Weight: ${totalWeight.toStringAsFixed(2)} g'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Show Total Nutrition'),
          ),
        ),
      ],
    );
  }
}
