import 'dart:convert';

import 'package:api_practice02/data/model/multiple_food_page.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl='https://www.themealdb.com/api/json/v1/1';
  Future<MultipleFood>fetchMultiplefood()async{
    final response=await http.get(Uri.parse('$_baseUrl/random.php'));
    if(response.statusCode==200){
      return MultipleFood.fromJson(json.decode(response.body));
    }else{
      throw Exception('Faild to load Multiple food');
    }
  }
}