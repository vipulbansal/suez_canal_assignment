//Article List

import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';
import 'package:suez_canal_assignment/data/models/data_response_model.dart';

import '../../core/resources/data_state.dart';


abstract class NutritionDetailsRepository{
Future<DataState<DataResponseModel>> getNutritionDetails(
  IngredientRequestParams params);
}