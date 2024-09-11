import 'dart:convert';

NutritionDetailModel nutritionDetailModelFromJson(String str) => NutritionDetailModel.fromJson(json.decode(str));

String nutritionDetailModelToJson(NutritionDetailModel data) => json.encode(data.toJson());

class NutritionDetailModel {
  String? uri;
  num? nutritionDetailModelYield;
  num? calories;
  double? totalWeight;
  List<String>? dietLabels;
  List<String>? healthLabels;
  List<dynamic>? cautions;
  Map<String, TotalDaily>? totalNutrients;
  Map<String, TotalDaily>? totalDaily;
  List<Ingredient>? ingredients;

  NutritionDetailModel({
    this.uri,
    this.nutritionDetailModelYield,
    this.calories,
    this.totalWeight,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.totalNutrients,
    this.totalDaily,
    this.ingredients,
  });

  NutritionDetailModel copyWith({
    String? uri,
    int? nutritionDetailModelYield,
    int? calories,
    double? totalWeight,
    List<String>? dietLabels,
    List<String>? healthLabels,
    List<dynamic>? cautions,
    Map<String, TotalDaily>? totalNutrients,
    Map<String, TotalDaily>? totalDaily,
    List<Ingredient>? ingredients,
  }) =>
      NutritionDetailModel(
        uri: uri ?? this.uri,
        nutritionDetailModelYield: nutritionDetailModelYield ?? this.nutritionDetailModelYield,
        calories: calories ?? this.calories,
        totalWeight: totalWeight ?? this.totalWeight,
        dietLabels: dietLabels ?? this.dietLabels,
        healthLabels: healthLabels ?? this.healthLabels,
        cautions: cautions ?? this.cautions,
        totalNutrients: totalNutrients ?? this.totalNutrients,
        totalDaily: totalDaily ?? this.totalDaily,
        ingredients: ingredients ?? this.ingredients,
      );

  factory NutritionDetailModel.fromJson(Map<String, dynamic> json) => NutritionDetailModel(
        uri: json["uri"],
        nutritionDetailModelYield: json["yield"],
        calories: json["calories"],
        totalWeight: json["totalWeight"]?.toDouble(),
        dietLabels: json["dietLabels"] == null ? [] : List<String>.from(json["dietLabels"]!.map((x) => x)),
        healthLabels: json["healthLabels"] == null ? [] : List<String>.from(json["healthLabels"]!.map((x) => x)),
        cautions: json["cautions"] == null ? [] : List<dynamic>.from(json["cautions"]!.map((x) => x)),
        totalNutrients: Map.from(json["totalNutrients"]!).map((k, v) => MapEntry<String, TotalDaily>(k, TotalDaily.fromJson(v))),
        totalDaily: Map.from(json["totalDaily"]!).map((k, v) => MapEntry<String, TotalDaily>(k, TotalDaily.fromJson(v))),
        ingredients: json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "yield": nutritionDetailModelYield,
        "calories": calories,
        "totalWeight": totalWeight,
        "dietLabels": dietLabels == null ? [] : List<dynamic>.from(dietLabels!.map((x) => x)),
        "healthLabels": healthLabels == null ? [] : List<dynamic>.from(healthLabels!.map((x) => x)),
        "cautions": cautions == null ? [] : List<dynamic>.from(cautions!.map((x) => x)),
        "totalNutrients": Map.from(totalNutrients!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "totalDaily": Map.from(totalDaily!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
      };
}

class Ingredient {
  String? text;
  List<Parsed>? parsed;

  Ingredient({
    this.text,
    this.parsed,
  });

  Ingredient copyWith({
    String? text,
    List<Parsed>? parsed,
  }) =>
      Ingredient(
        text: text ?? this.text,
        parsed: parsed ?? this.parsed,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        parsed: json["parsed"] == null ? [] : List<Parsed>.from(json["parsed"]!.map((x) => Parsed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "parsed": parsed == null ? [] : List<dynamic>.from(parsed!.map((x) => x.toJson())),
      };
}

class Parsed {
  num? quantity;
  String? measure;
  String? foodMatch;
  String? food;
  String? foodId;
  double? weight;
  double? retainedWeight;
  Map<String, TotalDaily>? nutrients;
  String? measureUri;
  String? status;

  Parsed({
    this.quantity,
    this.measure,
    this.foodMatch,
    this.food,
    this.foodId,
    this.weight,
    this.retainedWeight,
    this.nutrients,
    this.measureUri,
    this.status,
  });

  Parsed copyWith({
    int? quantity,
    String? measure,
    String? foodMatch,
    String? food,
    String? foodId,
    double? weight,
    double? retainedWeight,
    Map<String, TotalDaily>? nutrients,
    String? measureUri,
    String? status,
  }) =>
      Parsed(
        quantity: quantity ?? this.quantity,
        measure: measure ?? this.measure,
        foodMatch: foodMatch ?? this.foodMatch,
        food: food ?? this.food,
        foodId: foodId ?? this.foodId,
        weight: weight ?? this.weight,
        retainedWeight: retainedWeight ?? this.retainedWeight,
        nutrients: nutrients ?? this.nutrients,
        measureUri: measureUri ?? this.measureUri,
        status: status ?? this.status,
      );

  factory Parsed.fromJson(Map<String, dynamic> json) => Parsed(
        quantity: json["quantity"],
        measure: json["measure"],
        foodMatch: json["foodMatch"],
        food: json["food"],
        foodId: json["foodId"],
        weight: json["weight"]?.toDouble(),
        retainedWeight: json["retainedWeight"]?.toDouble(),
        nutrients: Map.from(json["nutrients"]!).map((k, v) => MapEntry<String, TotalDaily>(k, TotalDaily.fromJson(v))),
        measureUri: json["measureURI"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "measure": measure,
        "foodMatch": foodMatch,
        "food": food,
        "foodId": foodId,
        "weight": weight,
        "retainedWeight": retainedWeight,
        "nutrients": Map.from(nutrients!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "measureURI": measureUri,
        "status": status,
      };
}

class TotalDaily {
  String? label;
  double? quantity;
  String? unit;

  TotalDaily({
    this.label,
    this.quantity,
    this.unit,
  });

  TotalDaily copyWith({
    String? label,
    double? quantity,
    String? unit,
  }) =>
      TotalDaily(
        label: label ?? this.label,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
      );

  factory TotalDaily.fromJson(Map<String, dynamic> json) => TotalDaily(
        label: json["label"],
        quantity: json["quantity"]?.toDouble(),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "quantity": quantity,
        "unit": unit,
      };
}
