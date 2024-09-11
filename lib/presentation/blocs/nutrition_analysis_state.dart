part of 'nutrition_analysis_bloc.dart';

@immutable
abstract class NutritionAnalysisState {}

class NutritionAnalysisInitial extends NutritionAnalysisState {}

class NutritionAnalysisLoading extends NutritionAnalysisState {}

class NutritionAnalysisFail extends NutritionAnalysisState {
  final String message;

  NutritionAnalysisFail({required this.message});
}

class NutritionAnalysisSuccess extends NutritionAnalysisState {
  final DataResponseModel nutritionAnalysisData;

  NutritionAnalysisSuccess({required this.nutritionAnalysisData});
}
