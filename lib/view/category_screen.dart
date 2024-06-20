import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/category_controller.dart';
import 'package:newsapp/utils/colorTheme.dart';
import 'package:newsapp/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {

  void fetchData(BuildContext context) async {
    Provider.of<CategoryController>(context,listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Consumer<CategoryController>(
      builder: ( context, provider,child) {
        return DefaultTabController(
          length: provider.categoryList.length,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
             // backgroundColor: NewsColor.themeColor,
              bottom: TabBar(
                //labelStyle: ,
                labelColor: Colors.white,

                unselectedLabelColor: NewsColor.themeColor,
                  indicatorPadding: const EdgeInsets.symmetric(
                      horizontal: 0.15,),
                  //unselectedLabelStyle: ,
                   overlayColor: WidgetStatePropertyAll(Colors.white),
                  indicator: BoxDecoration(
                      color: NewsColor.themeColor,
                      borderRadius: BorderRadius.circular(5)),
                  isScrollable: true,

                  tabs: List.generate(
                      provider.categoryList.length,
                      (index) => Tab(
                        text:provider.categoryList[index]
                      )),
                onTap: (value) {
                    provider.onTap(index: value);
                },
              ),
            ),

            body: provider.isLoading == true ? Center(
              child: LottieBuilder.asset("assets/animations/loading.json",
                    fit: BoxFit.cover,
                     height: 150,
                      width: 150,),)
                :ListView.separated(
                itemBuilder: (context, index) => NewsCard(
                  title: provider.newsModel.articles?[index].title.toString()
                      ?? "",
                  description: provider.newsModel.articles?[index].description
                      .toString() ?? "",
                  date: provider.newsModel.articles?[index].publishedAt,
                  imageUrl: provider.newsModel.articles?[index].urlToImage
                      .toString() ?? "",
                  contant: provider.newsModel.articles?[index].content
                      .toString() ?? "",
                  sourceName: provider.newsModel.articles?[index].source?.name
                      .toString() ??
                      "",
                  url: provider.newsModel.articles?[index].url
                      .toString() ??
                      "",
                ),
                separatorBuilder: (context, index) => const Divider(
                  height: 20,),
                itemCount: provider.newsModel.articles?.length ?? 0)

          ),
        );
      },

    );
  }
}
