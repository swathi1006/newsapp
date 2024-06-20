import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/home_screen_controller.dart';
import 'package:newsapp/utils/colorTheme.dart';
import 'package:newsapp/utils/textTheme.dart';
import 'package:newsapp/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  void fetchData(BuildContext context){
    Provider.of<HomeScreenController>(context,listen: false)
        .fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NewsColor.themeColor,
        title: Text("News Today 🗞️"),
        titleTextStyle: NewsText.headingText,
      ),
      body: Consumer<HomeScreenController>(
        builder: (context,provider,child){
          return provider.isLoading == true
              ? Center(
              child: LottieBuilder.asset("assets/animations/loading.json",
              fit: BoxFit.cover,
              height: 150,
              width: 150,))
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    itemBuilder: (context,index) => NewsCard(
                      title: provider.newsModel.articles?[index].title.toString() ?? "",
                      description: provider.newsModel.articles?[index].description.toString() ?? "",
                      date: provider.newsModel.articles?[index].publishedAt,
                      imageUrl: provider.newsModel.articles?[index].urlToImage.toString() ?? "",
                      contant: provider.newsModel.articles?[index].content.toString() ?? "",
                      sourceName: provider.newsModel.articles?[index].source?.name.toString() ?? "",
                      url: provider.newsModel.articles?[index].url.toString() ?? "",
                    ),
                    separatorBuilder: (context,index) => Divider(height: 20,),
                    itemCount: provider.newsModel.articles?.length??0),
              );
        }
      ),
    );
  }
}
