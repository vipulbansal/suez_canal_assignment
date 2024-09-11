import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';

import '../../../core/network/request_helper.dart';

class NutritionApiService {
  final String apiId = dotenv.env['API_ID']!;
  final String apiKey = dotenv.env['API_KEY']!;

  NutritionApiService();

  Future getNutritionDetails({required IngredientRequestParams ingredientRequestParams}) async {
    String endPoint = "nutrition-details?app_id=$apiId&app_key=$apiKey";
    return RequestHelper.post(endpoint: endPoint, data: ingredientRequestParams.toJson());
  }
}
