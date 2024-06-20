import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/splash_controller.dart';
import 'package:newsapp/utils/textTheme.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);

    Future.delayed(Duration(seconds: 15),(){
      splashScreenProvider.setLoading(false);
    });

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("NEWS TODAY",
               style:  NewsText.textMain,),
              if(splashScreenProvider.isLoading)
                LottieBuilder.asset("assets/animations/anim1.json",height: 120,width: 120,)

            ],
          ),
        ),
    );
  }
}
