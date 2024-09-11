import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';
import 'package:suez_canal_assignment/domain/repositories/nutrition_details_repository.dart';

import '../../core/resources/data_state.dart';
import '../../core/use_case.dart';
import '../../data/models/data_response_model.dart';

class NutritionDetailsUsecase
    implements
        UseCase<DataState<DataResponseModel>, IngredientRequestParams> {
  final NutritionDetailsRepository _nutritionDetailsRepository;

  NutritionDetailsUsecase(
      this._nutritionDetailsRepository,
      );

  @override
  Future<DataState<DataResponseModel>> call(
      {IngredientRequestParams? params}) {
    return _nutritionDetailsRepository.getNutritionDetails(params!);
  }
}