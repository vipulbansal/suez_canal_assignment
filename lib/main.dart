import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:suez_canal_assignment/presentation/blocs/nutrition_analysis_bloc.dart';
import 'package:suez_canal_assignment/presentation/views/ingredients_nutrition_summary_screen.dart';
import 'package:suez_canal_assignment/presentation/views/nutrition_analysis_screen.dart';
import 'package:suez_canal_assignment/presentation/views/total_nutrition_analysis_screen.dart';

import 'core/utils/routes.dart';
import 'core/utils/snackbar_helper.dart';
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NutritionAnalysisBloc>(
          create: (_) => injector(),
        ),
      ],
      child: MaterialApp(
        title: 'Suez Canal Bank App',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: SnackBarHelper.scaffoldMessengerKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          ingredientsNutritionSummaryScreenRoute: (context) => const IngredientsNutritionSummaryScreen(),
          totalNutritionAnalysisScreen: (context) => const TotalNutritionAnalysisScreen(),
        },
        home: const NutritionAnalysisScreen(),
      ),
    );
  }
}
