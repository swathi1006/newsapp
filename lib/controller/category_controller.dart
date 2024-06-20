import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newsapp/model/news_Model.dart';
import 'package:http/http.dart' as http;

class CategoryController with ChangeNotifier{

  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  String category = "business";
  
  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }
  
  late NewsModel newsModel;
  bool isLoading = false;
  
  fetchData() async {
    isLoading = true;
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=83b5c137148e4d94b410436abde710e7");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if(response.statusCode == 200){
      decodedData = jsonDecode(response.body);
    }else{
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
  
}