import 'package:flutter/material.dart';
import 'package:suez_canal_assignment/data/models/nutrition_detail_model.dart';

class TotalNutritionAnalysisScreen extends StatelessWidget {
  const TotalNutritionAnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingredient = ModalRoute.of(context)!.settings.arguments as Parsed;

    final calories = ingredient.nutrients?['ENERC_KCAL']?.quantity?.toInt() ?? 0;
    final fat = ingredient.nutrients?['FAT']?.quantity?.toDouble() ?? 0.0;
    final cholesterol = ingredient.nutrients?['CHOLE']?.quantity?.toDouble() ?? 0.0;
    final sodium = ingredient.nutrients?['NA']?.quantity?.toDouble() ?? 0.0;
    final carbohydrate = ingredient.nutrients?['CHOCDF']?.quantity?.toDouble() ?? 0.0;
    final fiber = ingredient.nutrients?['FIBTG']?.quantity?.toDouble() ?? 0.0;
    final sugar = ingredient.nutrients?['SUGAR']?.quantity?.toDouble() ?? 0.0;
    final protein = ingredient.nutrients?['PROCNT']?.quantity?.toDouble() ?? 0.0;
    final vitamin = ingredient.nutrients?['VITC']?.quantity?.toDouble() ?? 0.0;
    final calcium = ingredient.nutrients?['CA']?.quantity?.toDouble() ?? 0.0;
    final iron = ingredient.nutrients?['FE']?.quantity?.toDouble() ?? 0.0;
    final potassium = ingredient.nutrients?['K']?.quantity?.toDouble() ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(ingredient.food ?? 'Ingredient Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNutritionRow('Calories', calories.toString(), 'kcal'),
            _buildNutritionRow('Fat', fat.toStringAsFixed(2), 'g'),
            _buildNutritionRow('Cholesterol', cholesterol.toStringAsFixed(2), 'mg'),
            _buildNutritionRow('Sodium', sodium.toStringAsFixed(2), 'mg'),
            _buildNutritionRow('Carbohydrate', carbohydrate.toStringAsFixed(2), 'g'),
            _buildNutritionRow('Fiber', fiber.toStringAsFixed(2), 'g'),
            _buildNutritionRow('Sugar', sugar.toStringAsFixed(2), 'g'),
            _buildNutritionRow('Protein', protein.toStringAsFixed(2), 'g'),
            _buildNutritionRow('Vitamin C', vitamin.toStringAsFixed(2), 'mg'),
            _buildNutritionRow('Calcium', calcium.toStringAsFixed(2), 'mg'),
            _buildNutritionRow('Iron', iron.toStringAsFixed(2), 'mg'),
            _buildNutritionRow('Potassium', potassium.toStringAsFixed(2), 'mg'),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionRow(String label, String value, String unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text('$value $unit', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
