import 'package:flutter/material.dart';
import 'package:newsapp/utils/colorTheme.dart';
import 'package:provider/provider.dart';

import '../controller/botton_nav_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Provider.of<BottomNavController>(context)
               .myPages[Provider.of<BottomNavController>(context).selectedIndex],

    bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: NewsColor.themeColor,),
            child: BottomNavigationBar(
            currentIndex:
                Provider.of<BottomNavController>(context).selectedIndex,
              onTap: Provider.of<BottomNavController>(context,listen: false).onItemTap,
              elevation: 0,
              backgroundColor: NewsColor.themeColor,
              selectedIconTheme: IconThemeData(
                  color: Colors.white,
                size: 25),
              unselectedIconTheme: IconThemeData(
                size: 25,),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: "Category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search"),
              ],
            ),
      ),
    ),
    );
  }
}
