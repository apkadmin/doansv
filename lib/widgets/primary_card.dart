import 'package:flutter/material.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/news.dart';

class PrimaryCard extends StatelessWidget {
  final News news;
  PrimaryCard({this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: kGrey3, width: 1.0)),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     CircleAvatar(
          //       radius: 5.0,
          //       backgroundColor: kGrey1,
          //     ),
          //     SizedBox(width: 10.0),
          //     Text(
          //       news.title,
          //       maxLines: 1,
          //       overflow: TextOverflow.ellipsis,
          //       style: kCategoryTitle,
          //     )
          //   ],
          // ),
          SizedBox(height: 5.0),
          Expanded(
              child: Hero(
            tag: news.id,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.bnews.vn/MediaUpload/Org/2017/07/31/152635_hoc-vien-ky-thuat-mat-ma.jpg"),
                      fit: BoxFit.cover)),
            ),
          )),
          SizedBox(height: 5.0),
          Text(
            news.subTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: kTitleCard,
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Text(news.created_at, style: kDetailContent),
              SizedBox(width: 10.0),
              CircleAvatar(radius: 5.0, backgroundColor: kGrey1),
              SizedBox(width: 10.0),
              Text(
                "${news.view} views read",
                style: kDetailContent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
