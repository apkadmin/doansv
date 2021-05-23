import 'package:flutter/material.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/teacher.model.dart';

class TeacherCard extends StatelessWidget {
  final Teacher teacher;

  TeacherCard({this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: kGrey3, width: 1.0)),
      child: Row(
        children: [
          Container(
              width: 90.0,
              height: 135.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: NetworkImage(teacher.image != ''
                          ? teacher.image
                          : "https://st.quantrimang.com/photos/image/2017/04/08/anh-dai-dien-FB-200.jpg"),
                      fit: BoxFit.cover))),
          SizedBox(width: 4.0),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tên GVHD: " + teacher.level + ". " + teacher.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: kTitleCard,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Công tác: " + teacher.workspace,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: kDetailContent,
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text(
                          "Đt: " + teacher.phone,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: kDetailContent,
                        ),
                      ],
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
