import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';
import 'package:suez_canal_assignment/presentation/blocs/nutrition_analysis_bloc.dart';

class NutritionAnalysisScreen extends StatefulWidget {
  const NutritionAnalysisScreen({super.key});

  @override
  State<NutritionAnalysisScreen> createState() => _NutritionAnalysisScreenState();
}

class _NutritionAnalysisScreenState extends State<NutritionAnalysisScreen> {
  final TextEditingController _ingredientController = TextEditingController();
  bool _isAnalyzeButtonEnabled = false;
 late  NutritionAnalysisBloc nutritionAnalysisBloc;

  @override
  void initState() {
    nutritionAnalysisBloc=BlocProvider.of<NutritionAnalysisBloc>(context);
    super.initState();

    // Listen to changes in the text field
    _ingredientController.addListener(() {
      setState(() {
        // Enable the Analyze button only if the text field is not empty
        _isAnalyzeButtonEnabled = _ingredientController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Dispose the controller when no longer needed
    _ingredientController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nutrition Analysis"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Multi-line TextField for input
                    TextField(
                      controller: _ingredientController,
                      maxLines: null, // Make it multi-line
                      decoration: InputDecoration(
                        hintText: "Enter ingredients line by line (e.g. 1 cup rice) and comma at the end of the line",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 20),

                    // Analyze button

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _isAnalyzeButtonEnabled
                  ? () async{
                List<String> ingredients=_ingredientController.text.split(',');
                nutritionAnalysisBloc.add(AnalyzeIngredientsEvent(ingredientRequestParams: IngredientRequestParams(ingr: ingredients)));
              }
                  : null, // Disable the button if no ingredients are entered
              child: Text("Analyze"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Button covers full width
              ),
            ),
          )
        ],
      ),
    );
  }
}
