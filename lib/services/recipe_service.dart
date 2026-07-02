/*FILE FOR API LOGIC */
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_tutorial/models/recipe_model.dart';

class RecipeService{
  final dio=Dio();

  Future<RecipeModel> getRecipes()async {
try{
Response apiResponse=await dio.get('https://dummyjson.com/recipes');
return RecipeModel.fromJson(jsonDecode(apiResponse.data));
}

 on DioException catch(e){
  // return RecipeModel();
  log('Error while calling for recipe API: $e');
  throw 'SOME ERROR';
 }
//  log(apiResponse.data.toString());
 
  }
}