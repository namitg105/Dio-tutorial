import 'package:dio/dio.dart';
import 'package:dio_tutorial/models/recipe_model.dart';
import 'package:dio_tutorial/services/recipe_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
RecipeModel? recipeModel;
  @override
  void initState() {
    getRecipeData();
   super.initState();
  }


  getRecipeData()async{
   try {
  recipeModel= await RecipeService().getRecipes();
  setState(() {});
} on DioException catch (e) {
  //showSnackBar error
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));


throw e.toString();
}

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('data')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>getRecipeData(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}