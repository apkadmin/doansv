import 'package:flutter/material.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/widgets/project_stage_card.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Thông tin đồ án",
            style: kActiveTabStyle,
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                        "Đồ Án nghiên cứu và phát triển hệ thống thông minh"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Giáo viên hướng dẫn: TS . Nguyễn Đào TRuruowfng ",
                    style: kCategoryTitle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Khoa: CNTT",
                    style: kCategoryTitle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Học viện KTMM",
                    style: kCategoryTitle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Số điện thoại: 0946-562-168",
                    style: kCategoryTitle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Gmail: truongnguyendao@gmail.com",
                    style: kCategoryTitle,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text("Nội dung: ádf a ákdhjfl kạhakhdf akjsdhf"),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text("Yêu Cầu: ádf a ákdhjfl kạhakhdf akjsdhf"),
                  SizedBox(
                    height: 10.0,
                  ),
                  ProjectStageCard(
                    title: "Chi tiết báo cáo tiến đồ đợt 1",
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ProjectStageCard(
                    title: "Chi tiết báo cáo tiến đồ đợt 2",
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ProjectStageCard(
                    title: "Chi tiết báo cáo tiến đồ đợt 3",
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ProjectStageCard(
                    title: "Chi tiết báo cáo tiến đồ đợt 4",
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
