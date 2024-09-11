import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suez_canal_assignment/presentation/blocs/nutrition_analysis_bloc.dart';
import 'package:suez_canal_assignment/presentation/views/nutrition_analysis_screen.dart';

import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NutritionAnalysisScreen(),
      ),
    );
  }
}