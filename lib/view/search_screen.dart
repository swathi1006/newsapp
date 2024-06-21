import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/search_controller.dart';
import 'package:newsapp/utils/colorTheme.dart';
import 'package:newsapp/view/widgets/news_card.dart';
import 'package:provider/provider.dart';
import '';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider = Provider.of<SearchScreenController>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 45,
                    width: MediaQuery.sizeOf(context).width * 2 / 3,
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff6A3DE8),
                            width: 3 )),
                      )
                    ),),
                    Expanded(
                        child: ElevatedButton(onPressed: (){
                          provider.searchData(
                            searchText: textController.text.toLowerCase());
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xff6A3DE8) )),
                            child: Text("Search")) ),
                  ],
                ),
                Expanded(
                    child:  Provider.of<SearchScreenController>(context).
                isLoading == true
                ? Center(
                      child: LottieBuilder.asset("assets/animations/loading.json",
                                fit: BoxFit.cover,
                                 height: 150,
                                 width: 150,),)
                        : ListView.separated(itemBuilder: (context, index) => NewsCard(
                        title: provider.newsModel?.articles?[index].title ?? "",
                        description: provider.newsModel?.articles?[index].description ?? "",
                        date: provider.newsModel?.articles?[index].publishedAt,
                        imageUrl: provider.newsModel?.articles?[index].urlToImage ?? "",
                        contant: provider.newsModel?.articles?[index].content ?? "",
                        sourceName: provider.newsModel?.articles?[index].source?.name ?? "",
                        url: provider.newsModel?.articles?[index].url ?? ""
                    ),
                        separatorBuilder: (context, index) => const Divider(height: 20),
                        itemCount: provider.newsModel?.articles?.length ?? 0)
                ),
              ],
            ),
          ) ),
    );
  }
}


