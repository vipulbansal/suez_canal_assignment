import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';
import 'package:suez_canal_assignment/core/utils/navigation_helper.dart';
import 'package:suez_canal_assignment/core/utils/snackbar_helper.dart';
import 'package:suez_canal_assignment/data/models/nutrition_detail_model.dart';
import 'package:suez_canal_assignment/presentation/blocs/nutrition_analysis_bloc.dart';
import 'package:suez_canal_assignment/presentation/widgets/loading_widget.dart';

import '../../core/utils/routes.dart';

class NutritionAnalysisScreen extends StatefulWidget {
  const NutritionAnalysisScreen({super.key});

  @override
  State<NutritionAnalysisScreen> createState() =>
      _NutritionAnalysisScreenState();
}

class _NutritionAnalysisScreenState extends State<NutritionAnalysisScreen> {
  final TextEditingController _ingredientController = TextEditingController();
  bool _isAnalyzeButtonEnabled = false;
  late NutritionAnalysisBloc nutritionAnalysisBloc;

  @override
  void initState() {
    nutritionAnalysisBloc = BlocProvider.of<NutritionAnalysisBloc>(context);
    super.initState();
    _ingredientController.addListener(() {
      setState(() {
        _isAnalyzeButtonEnabled = _ingredientController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nutrition Analysis"),
      ),
      body: BlocConsumer<NutritionAnalysisBloc, NutritionAnalysisState>(
        listener: (context, state) {
          if (state is NutritionAnalysisSuccess) {
            NutritionDetailModel nutritionDetailModel =
            NutritionDetailModel.fromJson(
                state.nutritionAnalysisData.data!);
            context.pushNamed(ingredientsNutritionSummaryScreenRoute,
                arguments: nutritionDetailModel);
          } else if (state is NutritionAnalysisFail) {
            SnackBarHelper.showSnackBar(state.message);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: bottomInset),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: _ingredientController,
                              maxLines: null, // Make it multi-line
                              decoration: InputDecoration(
                                hintText:
                                "Enter ingredients line by line (e.g. 1 cup rice) and comma at the end of the line",
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: _isAnalyzeButtonEnabled
                          ? () async {
                        FocusScope.of(context).unfocus();
                        List<String> ingredients;
                        if (_ingredientController.text.contains(',')) {
                          String cleanedText = _ingredientController.text
                              .replaceAll('\n', '')
                              .replaceAll('\r', '')
                              .trim();
                          ingredients = cleanedText
                              .split(',')
                              .map((ingredient) => ingredient.trim())
                              .toList();
                        } else {
                          ingredients = [_ingredientController.text];
                        }

                        nutritionAnalysisBloc.add(AnalyzeIngredientsEvent(
                            ingredientRequestParams:
                            IngredientRequestParams(
                                ingr: ingredients)));
                      }
                          : null,
                      child: const Text("Analyze"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ),
                ],
              ),
              if (state is NutritionAnalysisLoading)
                const LoadingWidget(
                  message: "Fetching data...",
                ),
            ],
          );
        },
      ),
    );
  }
}
