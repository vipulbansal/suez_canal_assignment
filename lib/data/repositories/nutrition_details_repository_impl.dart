import 'dart:convert';
import 'dart:io';

import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';
import 'package:suez_canal_assignment/core/resources/data_state.dart';
import 'package:suez_canal_assignment/data/datasources/remote/nutrition_api_service.dart';
import 'package:suez_canal_assignment/data/models/data_response_model.dart';
import 'package:suez_canal_assignment/domain/repositories/nutrition_details_repository.dart';
import 'package:http/http.dart' as http;

class NutritionDetailsRepositoryImplementation
    implements NutritionDetailsRepository {
  NutritionApiService _nutritionApiService;

  NutritionDetailsRepositoryImplementation(this._nutritionApiService);

  @override
  Future<DataState<DataResponseModel>> getNutritionDetails(
      IngredientRequestParams params) async {
    try {
      final httpResponse = await _nutritionApiService.getNutritionDetails(
          ingredientRequestParams: params);
      if (httpResponse.runtimeType == http.Response) {
        return DataSuccess(DataResponseModel.fromJson(
            json.decode((httpResponse as http.Response).body)));
      } else {
        return DataFailed(HttpException(
            httpResponse.response.toString(),
        ));
      }
    } on HttpException catch (e) {
      return DataFailed(e);
    }
  }
}
