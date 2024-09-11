import 'dart:io';

import 'package:suez_canal_assignment/core/params/ingredient_request_params.dart';

import '../../../core/network/request_helper.dart';
import '../../models/data_response_model.dart';

 class NutritionApiService{


  NutritionApiService();

  Future getNutritionDetails({required IngredientRequestParams ingredientRequestParams})async{
    String endPoint="nutrition-details?app_id=44e0b622&app_key=85322273d2d05760e572e5e31f3ac236";
    return RequestHelper.post(endpoint: endPoint,data: ingredientRequestParams.toJson());
  }
}