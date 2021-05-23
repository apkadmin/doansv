import 'package:flutter/material.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/project.model.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;

  const ProjectDetail({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: kGrey3,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kGrey3,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Chi tiết đồ án",
            style: kTitleCard,
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              shrinkWrap: true,
              children: [
                SizedBox(height: 12.0),
                Hero(
                  tag: "24k",
                  child: Container(
                    height: 220.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: AssetImage("assets/images/kmaBg.jpeg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      project.name,
                      style: kTitleCard.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Giáo viên hướng dẫn: Ts. ${project.nameTeacher}",
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
                Material(
                  color: kGrey3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                      color: kBlack.withOpacity(0.2),
                    ),
                  ),
                  child: TabBar(
                    unselectedLabelColor: kBlack,
                    indicator: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(12.0)),
                    tabs: [
                      Tab(text: "Yêu cầu đề tài"),
                      Tab(text: "Nội dung đề tài"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200.0,
                  child: TabBarView(
                    children: [
                      YeuCauProject(
                        yeucau: project.projectRequest,
                      ),
                      NoiDungProject(
                        noidung: project.projectContent,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(onPressed: () {}, child: Text("Đăng ký")),
          ),
        ),
      ),
    );
  }
}

class YeuCauProject extends StatelessWidget {
  final String yeucau;

  const YeuCauProject({Key key, this.yeucau}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
      child: Text(yeucau),
    );
  }
}

class NoiDungProject extends StatelessWidget {
  final String noidung;

  const NoiDungProject({Key key, this.noidung}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
        child: Text(noidung));
  }
}
