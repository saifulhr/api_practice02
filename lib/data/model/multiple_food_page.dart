import 'dart:convert';

MultipleFood multipleFoodFromJson(String str) => MultipleFood.fromJson(json.decode(str));

String multipleFoodToJson(MultipleFood data) => json.encode(data.toJson());

class MultipleFood {
    List<Map<String, String?>> meals;

    MultipleFood({
        required this.meals,
    });

    factory MultipleFood.fromJson(Map<String, dynamic> json) => MultipleFood(
        meals: List<Map<String, String?>>.from(json["meals"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
