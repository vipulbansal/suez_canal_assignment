import 'dart:convert';

IngredientRequestParams ingredientRequestParamsFromJson(String str) => IngredientRequestParams.fromJson(json.decode(str));

String ingredientRequestParamsToJson(IngredientRequestParams data) => json.encode(data.toJson());

class IngredientRequestParams {
  List<String> ingr;

  IngredientRequestParams({
    required this.ingr,
  });

  IngredientRequestParams copyWith({
    List<String>? ingr,
  }) =>
      IngredientRequestParams(
        ingr: ingr ?? this.ingr,
      );

  factory IngredientRequestParams.fromJson(Map<String, dynamic> json) => IngredientRequestParams(
        ingr: List<String>.from(json["ingr"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ingr": List<dynamic>.from(ingr.map((x) => x)),
      };
}
