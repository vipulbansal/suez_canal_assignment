import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:suez_canal_assignment/presentation/blocs/nutrition_analysis_bloc.dart';
import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:suez_canal_assignment/core/resources/data_state.dart';
import 'package:suez_canal_assignment/data/models/data_response_model.dart';

import '../mocks/mock_nutrition_details_usecase.mocks.dart';

void main() {
  late NutritionAnalysisBloc nutritionAnalysisBloc;
  late MockNutritionDetailsUsecase mockNutritionDetailsUsecase;

  setUp(() {
    mockNutritionDetailsUsecase = MockNutritionDetailsUsecase();
    nutritionAnalysisBloc = NutritionAnalysisBloc(mockNutritionDetailsUsecase);
  });

  blocTest<NutritionAnalysisBloc, NutritionAnalysisState>(
    'emits [NutritionAnalysisLoading, NutritionAnalysisSuccess] when AnalyzeIngredientsEvent succeeds',
    build: () {
      when(mockNutritionDetailsUsecase.call(params: anyNamed('params')))
          .thenAnswer((_) async => DataSuccess<DataResponseModel>(
          DataResponseModel(data: {'nutrition': 'success'})));
      return nutritionAnalysisBloc;
    },
    act: (bloc) => bloc.add(AnalyzeIngredientsEvent(
        ingredientRequestParams: IngredientRequestParams(ingr: ['1 apple']))),
    expect: () => [
      isA<NutritionAnalysisLoading>(),
      isA<NutritionAnalysisSuccess>(),
    ],
  );

  blocTest<NutritionAnalysisBloc, NutritionAnalysisState>(
    'emits [NutritionAnalysisLoading, NutritionAnalysisFail] when AnalyzeIngredientsEvent fails',
    build: () {
      when(mockNutritionDetailsUsecase.call(params: anyNamed('params')))
          .thenAnswer((_) async => DataFailed(HttpException("Failed")));
      return nutritionAnalysisBloc;
    },
    act: (bloc) => bloc.add(AnalyzeIngredientsEvent(
        ingredientRequestParams: IngredientRequestParams(ingr: ['1 apple']))),
    expect: () => [
      isA<NutritionAnalysisLoading>(),
      isA<NutritionAnalysisFail>(),
    ],
  );
}
