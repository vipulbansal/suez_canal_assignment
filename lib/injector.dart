

import 'package:get_it/get_it.dart';
import 'package:suez_canal_assignment/core/network/request_helper.dart';
import 'package:suez_canal_assignment/data/datasources/remote/nutrition_api_service.dart';
import 'package:suez_canal_assignment/data/repositories/nutrition_details_repository_impl.dart';
import 'package:suez_canal_assignment/domain/repositories/nutrition_details_repository.dart';
import 'package:suez_canal_assignment/domain/usecases/nutrition_details_usecase.dart';
import 'package:suez_canal_assignment/presentation/blocs/nutrition_analysis_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<NutritionApiService>(NutritionApiService());
  injector.registerSingleton<NutritionDetailsRepository>(NutritionDetailsRepositoryImplementation(injector()));
  injector.registerSingleton<NutritionDetailsUsecase>(NutritionDetailsUsecase(injector()));
  injector.registerFactory<NutritionAnalysisBloc>(()=>NutritionAnalysisBloc(injector()));
}