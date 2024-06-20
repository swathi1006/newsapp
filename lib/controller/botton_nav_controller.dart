import 'package:flutter/material.dart';
import 'package:newsapp/view/category_screen.dart';
import 'package:newsapp/view/home_screen.dart';
import 'package:newsapp/view/search_screen.dart';

class BottomNavController with ChangeNotifier{

  int selectedIndex = 0;

  void onItemTap(index){
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen()
  ];

}