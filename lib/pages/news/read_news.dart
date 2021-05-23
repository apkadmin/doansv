import 'package:flutter/material.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/news.dart';
import 'package:quanly_app/widgets/circle_button.dart';

class ReadNews extends StatelessWidget {
  final News news;
  ReadNews({this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0.0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            SizedBox(height: 12.0),
            Container(
              height: 220.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cafeduhoc.net/wp-content/uploads/2020/07/cafeduhoc_1563284591-hoc-vien-ky-thuat-mat-ma-cong-bo-diem-san-xet-tuyen-nam-2019.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 15.0),
            Text(news.title, style: kTitleCard),
            SizedBox(height: 15.0),
            Row(
              children: [
                Text(news.created_at, style: kDetailContent),
                SizedBox(width: 5.0),
                SizedBox(
                  width: 10.0,
                  child: Divider(
                    color: kBlack,
                    height: 1.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  "lượt xem : ${news.view}",
                  style: kDetailContent.copyWith(color: Colors.black),
                )
              ],
            ),
            SizedBox(height: 15.0),
            Text(
              news.content,
              style: kActiveTabStyle.copyWith(height: 2.0),
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
