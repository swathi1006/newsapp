import 'package:flutter/material.dart';
import 'package:newsapp/controller/botton_nav_controller.dart';
import 'package:newsapp/controller/category_controller.dart';
import 'package:newsapp/controller/search_controller.dart';
import 'package:newsapp/controller/splash_controller.dart';
import 'package:newsapp/view/mainPage.dart';
import 'package:newsapp/view/splashScreen.dart';
import 'package:provider/provider.dart';

import 'controller/home_screen_controller.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => SplashScreenProvider()),
          ChangeNotifierProvider(
              create: (context) => BottomNavController()),
          ChangeNotifierProvider(
            create: (context) => HomeScreenController(),
          ),
          ChangeNotifierProvider(
              create: (context) => CategoryController()),
          ChangeNotifierProvider(
              create: (context) => SearchScreenController() )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<SplashScreenProvider>(
            builder: (context,splashScreenProvider, widget){
              return splashScreenProvider.isLoading
                  ? SplashScreen()
                  : MainPage();
            },
          ),
        ),
    );
  }
}
