part of 'nutrition_analysis_bloc.dart';

@immutable
abstract class NutritionAnalysisEvent extends Equatable {}

class AnalyzeIngredientsEvent extends NutritionAnalysisEvent {
  IngredientRequestParams ingredientRequestParams;

  AnalyzeIngredientsEvent({required this.ingredientRequestParams});

  @override
  List<Object?> get props => [ingredientRequestParams];
}
