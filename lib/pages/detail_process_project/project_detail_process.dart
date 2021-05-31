import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/process_stage.dart';
import 'package:quanly_app/pages/detail_process_project/bloc/detail_process_project_bloc.dart';

class DetailProcessProject extends StatefulWidget {
  @override
  DetailProcessProjectState createState() => DetailProcessProjectState();
}

class DetailProcessProjectState extends State<DetailProcessProject> {
  DetailProcessProjectBloc detailProcessProjectBloc;
  @override
  void initState() {
    detailProcessProjectBloc = context.read();
    detailProcessProjectBloc.add(GetDetailProcess());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return BlocConsumer<DetailProcessProjectBloc,DetailProcesssProjectState>(
      listener: (context, state) {
        print("state listener : $state");
      },
    builder: (context, state) {
        if(state is DetailProcessProjectLoading)
          {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        else if(state is DetailProcessProjectLoaded)
          {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text("Chi tiết đồ án", style: kTitleProfile.copyWith(fontSize: 20)),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Sinh Viên ước lượng: ${state.processStage.studentRate}%", style: kTitleProfile.copyWith(fontSize: 14,fontWeight: FontWeight.normal)),
                    Text("Giáo viên đánh giá   : ${state.processStage.teacherRate}%", style: kTitleProfile.copyWith(fontSize: 14,fontWeight: FontWeight.normal)),
                    Text("Giáo viên đánh giá thái độ  : ${state.processStage.attitudeStudy}", style: kTitleProfile.copyWith(fontSize: 14,fontWeight: FontWeight.normal)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "STT",
                            style: kTitleCard.copyWith(fontSize: 12),
                          ),
                          SizedBox(width: 4,),
                          Text(
                            "Công việc",
                            style: kTitleCard.copyWith(fontSize: 12),
                          ),
                          SizedBox(width: 2,),
                          Text(
                            "Người thực hiện",
                            style: kTitleCard.copyWith(fontSize: 12),
                          ),
                          Text(
                            "Tiến độ(%)",
                            style: kTitleCard.copyWith(fontSize: 12),
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.processStage.listProgressLog.length,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.only(top: 20),
                          itemBuilder: (context, index) {
                            ListProgressLog procesLog = state.processStage.listProgressLog[index];
                            return Card(
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                height: 60,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("$index",style: kTitleCard.copyWith(fontSize: 12),textAlign: TextAlign.center,),
                                    Text("${procesLog.content}",style: kTitleCard.copyWith(fontSize: 12)),
                                    Text("${procesLog.worker}",style: kTitleCard.copyWith(fontSize: 12)),
                                    Text("${procesLog.percent}%",style: kTitleCard.copyWith(fontSize: 12)),

                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          }
        else if(state is DetailProcessProjectErros)
          {
            return Scaffold(body: Center(child: Text('Chưa có đánh giá'),),);
          }
        return Material(child: Center(child: CircularProgressIndicator()));
    }
    );
  }
}
