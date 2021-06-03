import 'package:flutter/material.dart';
import 'package:quanly_app/bloc/new_bloc.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/news.dart';
import 'package:quanly_app/pages/news/read_news.dart';
import 'package:quanly_app/widgets/primary_card.dart';
import 'package:quanly_app/widgets/secondary_card.dart';
import 'package:quanly_app/util/global_cache.dart';
import 'package:quanly_app/models/student.dart';


class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  NewsBLoC newsBLoC = new NewsBLoC();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String nameStudent = GlobalCache().getUser().nameStudent;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                "Xin chào",
                textAlign: TextAlign.end,
                style: kNonActiveTabStyle,
              ),
              subtitle: Text(
                nameStudent,
                textAlign: TextAlign.end,
                style: kActiveTabStyle,
              ),
              trailing: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/IMG_2242.JPG"))),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            StreamBuilder(
                stream: newsBLoC.newsList,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasError)
                        return Text("Có lỗi xảy ra: ${snapshot.error}");
                      List<News> news = snapshot.data;
                      return Container(
                        width: double.infinity,
                        height: 300.0,
                        padding: EdgeInsets.only(top: 10, left: 18.0),
                        child: ListView.builder(
                          itemCount: news?.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var _news = news[index];
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReadNews(news: _news)));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 12.0),
                                  child: PrimaryCard(news: _news),
                                ));
                          },
                        ),
                      );
                  }
                }),
            //
            SizedBox(height: 25.0),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 19.0),
                child: Text(
                  "Danh sách tin tức ",
                  style: kNonActiveTabStyle,
                ),
              ),
            ),
            StreamBuilder(
                stream: newsBLoC.newsList,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasError)
                        return Text("Có lỗi xảy ra: ${snapshot.error}");
                      List<News> news = snapshot.data;

                      return ListView.builder(
                          itemCount: news.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            var _news = news[index];
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReadNews(news: _news)));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 135.0,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 8.0),
                                  child: SecondaryCard(
                                    news: _news,
                                  ),
                                ));
                          });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
