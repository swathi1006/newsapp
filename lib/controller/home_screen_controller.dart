import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newsapp/model/news_Model.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier{
  late NewsModel newsModel;
  bool isLoading = false;
  var baseUrl = "https://newsapi.org";

  /// to process api and get response

fetchData() async {
    isLoading = true;
    // baseUrl+endpoint -> https://newsapi.org/v2/top-headlines?country=in&apiKey=83b5c137148e4d94b410436abde710e7
  final url = "$baseUrl/v2/top-headlines?country=in&apiKey=83b5c137148e4d94b410436abde710e7";
  final response = await http.get(Uri.parse(url));
  print(response.statusCode);
  Map<String,dynamic> decodeData = {}; // map for storing response body
  if (response.statusCode == 200){
    decodeData = jsonDecode(response.body);
  }else{
    print("Api failed");
  }
  newsModel = NewsModel.fromJson(decodeData);
  isLoading = false;
  notifyListeners();
}

// function to launch URL
  Future<void> launchURL(String url) async {
         final Uri url1 = Uri.parse(url);
         try {
           if (!await launchUrl(url1,mode: LaunchMode.inAppWebView)){
             await launchUrl(url1,mode: LaunchMode.inAppWebView);
           }else {
             throw "Could not launch $url";
           }
         } catch (e){
           print('Error launching URL: $e');
         }
         notifyListeners();
  }


/// to share news
  void shareText({String textToShare = ""}){
  try {
    Share.share(textToShare);
  } catch (e) {
    print("Error sharing: $e");
  }
  notifyListeners();
  }

}