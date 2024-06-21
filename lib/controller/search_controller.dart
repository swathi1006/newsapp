import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/model/news_Model.dart';
import 'package:http/http.dart' as http;

class SearchScreenController with ChangeNotifier{
  
  NewsModel? newsModel;
  bool isLoading = false;
  Future <void> searchData({required String searchText}) async {
    isLoading = false;
    final url = Uri.parse("https://newsapi.org/v2/everything?q=$searchText&sortBy=publishedAt&apiKey=83b5c137148e4d94b410436abde710e7");
    try{
      final response = await http.get(url,
           headers: {'Content-Type':'application/json',});
      print(response.statusCode);
      if(response.statusCode == 200){
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      }else {
        print("Api Failed");
      }
    }catch(e){
      print("Error : $e");
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }
}