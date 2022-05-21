import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/pages/detail_process_project/bloc/detail_process_project_bloc.dart';
import 'package:quanly_app/pages/detail_process_project/project_detail_process.dart';
import 'package:quanly_app/pages/project_page/detail_project_bloc.dart';
import 'package:quanly_app/service/detail_process_service.dart';
import 'package:quanly_app/widgets/project_stage_card.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  DetailProjectBloc detailProjectBloc;

  @override
  void initState() {
    detailProjectBloc = context.read();
    detailProjectBloc.add(LoadDetaiProject());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailProjectBloc, DetailProjectState>(
        listener: (context, state) {
      print("state listener : $state");
    }, builder: (context, state) {
      if (state is DetailProjectLoading) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is DetailProjectLoaded) {
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
                          "${state.detailProject.name ?? 'Chưa có'}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Giáo viên hướng dẫn: ${state.detailProject.nameTeacher ?? "Chưa có"} ",
                        style: kCategoryTitle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Khoa: ${state.detailProject.majors ?? 'chưa có'}",
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
                        "Số điện thoại: ${state.detailProject.phoneTeacher}",
                        style: kCategoryTitle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Gmail: ${state.detailProject.emailTeacher}",
                        style: kCategoryTitle,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text("Nội dung: ${state.detailProject.projectContent}"),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text("Yêu Cầu: ${state.detailProject.projectRequest}"),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                      create: (_) => DetailProcessProjectBloc(
                                          detailProcessService:
                                              DetailProcessService(
                                                  stages: 'stage1')),
                                      child: DetailProcessProject())));
                        },
                        child: ProjectStageCard(
                          title: "Chi tiết báo cáo tiến đồ đợt 1",
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                      create: (_) => DetailProcessProjectBloc(
                                          detailProcessService:
                                              DetailProcessService(
                                                  stages: 'stage2')),
                                      child: DetailProcessProject())));
                        },
                        child: ProjectStageCard(
                          title: "Chi tiết báo cáo tiến đồ đợt 2",
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                      create: (_) => DetailProcessProjectBloc(
                                          detailProcessService:
                                              DetailProcessService(
                                                  stages: 'stage3')),
                                      child: DetailProcessProject())));
                        },
                        child: ProjectStageCard(
                          title: "Chi tiết báo cáo tiến đồ đợt 3",
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                      create: (_) => DetailProcessProjectBloc(
                                          detailProcessService:
                                              DetailProcessService(
                                                  stages: 'stage4')),
                                      child: DetailProcessProject())));
                        },
                        child: ProjectStageCard(
                          title: "Chi tiết báo cáo tiến đồ đợt 4",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
      } else if (state is DetailProcessProjectErros) {
        return Center(
          child: Text("Bạn chưa đăng ký project"),
        );
      }
      return Center(
        child: Text("Bạn chưa đăng ký project"),
      );
    });
  }
}
