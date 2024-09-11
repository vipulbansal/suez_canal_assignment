import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:suez_canal_assignment/core/bloc/bloc_with_state.dart';
import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';
import 'package:suez_canal_assignment/core/resources/data_state.dart';
import 'package:suez_canal_assignment/data/models/data_response_model.dart';
import 'package:suez_canal_assignment/domain/usecases/nutrition_details_usecase.dart';

part 'nutrition_analysis_event.dart';

part 'nutrition_analysis_state.dart';

class NutritionAnalysisBloc
    extends BlocWithState<NutritionAnalysisEvent, NutritionAnalysisState> {
  NutritionDetailsUsecase _nutritionDetailsUsecase;

  NutritionAnalysisBloc(
    this._nutritionDetailsUsecase,
  ) : super(NutritionAnalysisInitial());

  @override
  Stream<NutritionAnalysisState> mapEventToState(
      NutritionAnalysisEvent event) async* {
    if (event is AnalyzeIngredientsEvent) {
      yield* _mapAnalyzeIngredientsToState(event.ingredientRequestParams);
    }
  }

  Stream<NutritionAnalysisState> _mapAnalyzeIngredientsToState(
      IngredientRequestParams ingredientRequestParams) async* {
    yield* runBlocProcess(() async* {
      yield NutritionAnalysisLoading();
      final dataState = await _nutritionDetailsUsecase(
        params: ingredientRequestParams,
      );
      if (dataState is DataSuccess) {
        final DataResponseModel? data = dataState.data;
        yield (NutritionAnalysisSuccess(nutritionAnalysisData: data!));
      } else if (dataState is DataFailed) {
        if (dataState.error != null) {
          yield NutritionAnalysisFail(message: dataState.error!.message);
        } else {
          yield NutritionAnalysisFail(message: "Server Issue");
        }
      }
    });
  }
}
