import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suez_canal_assignment/core/bloc/bloc_with_state.dart';
import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';
import 'package:suez_canal_assignment/core/resources/data_state.dart';
import 'package:suez_canal_assignment/data/models/data_response_model.dart';
import 'package:suez_canal_assignment/domain/usecases/nutrition_details_usecase.dart';

part 'nutrition_analysis_event.dart';

part 'nutrition_analysis_state.dart';

class NutritionAnalysisBloc extends BlocWithState<NutritionAnalysisEvent, NutritionAnalysisState> {
  final NutritionDetailsUsecase _nutritionDetailsUsecase;

  NutritionAnalysisBloc(this._nutritionDetailsUsecase) : super(NutritionAnalysisInitial()) {
    on<AnalyzeIngredientsEvent>(_onAnalyzeIngredients);
  }

  Future<void> _onAnalyzeIngredients(AnalyzeIngredientsEvent event, Emitter<NutritionAnalysisState> emit) async {
    await runBlocProcess(() async {
      emit(NutritionAnalysisLoading());
      final dataState = await _nutritionDetailsUsecase(
        params: event.ingredientRequestParams,
      );

      if (dataState is DataSuccess) {
        final DataResponseModel? data = dataState.data;
        if (data != null) {
          emit(NutritionAnalysisSuccess(nutritionAnalysisData: data));
        } else {
          emit(NutritionAnalysisFail(message: "No data found"));
        }
      } else if (dataState is DataFailed) {
        emit(NutritionAnalysisFail(message: dataState.error?.message ?? "Server Issue"));
      }
    });
  }
}
