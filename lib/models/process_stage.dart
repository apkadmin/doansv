import 'package:equatable/equatable.dart';

class ProcessStage  extends Equatable{
  String id;
  String idProject;
  String stage;
  int studentRate;
  int teacherRate;
  String attitudeStudy;
  String attWithTeacher;
  String abilityRate;
  String planState;
  String createdAt;
  String updatedAt;
  List<ListProgressLog> listProgressLog;

  ProcessStage(
      {this.id,
        this.idProject,
        this.stage,
        this.studentRate,
        this.teacherRate,
        this.attitudeStudy,
        this.attWithTeacher,
        this.abilityRate,
        this.planState,
        this.createdAt,
        this.updatedAt,
        this.listProgressLog});

  ProcessStage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProject = json['idProject'];
    stage = json['stage'];
    studentRate = json['studentRate'];
    teacherRate = json['teacherRate'];
    attitudeStudy = json['attitudeStudy'];
    attWithTeacher = json['attWithTeacher'];
    abilityRate = json['abilityRate'];
    planState = json['planState'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['listProgressLog'] != null) {
      listProgressLog = new List<ListProgressLog>();
      json['listProgressLog'].forEach((v) {
        listProgressLog.add(new ListProgressLog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idProject'] = this.idProject;
    data['stage'] = this.stage;
    data['studentRate'] = this.studentRate;
    data['teacherRate'] = this.teacherRate;
    data['attitudeStudy'] = this.attitudeStudy;
    data['attWithTeacher'] = this.attWithTeacher;
    data['abilityRate'] = this.abilityRate;
    data['planState'] = this.planState;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.listProgressLog != null) {
      data['listProgressLog'] =
          this.listProgressLog.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [id,idProject,stage,studentRate,teacherRate,attitudeStudy,attWithTeacher,abilityRate,planState,createdAt,updatedAt];
}

class ListProgressLog  extends Equatable{
  String id;
  String idProjectProgress;
  String content;
  String percent;
  String worker;
  String createdAt;
  String updatedAt;

  ListProgressLog(
      {this.id,
        this.idProjectProgress,
        this.content,
        this.percent,
        this.worker,
        this.createdAt,
        this.updatedAt});

  ListProgressLog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProjectProgress = json['idProjectProgress'];
    content = json['content'];
    percent = json['percent'];
    worker = json['worker'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idProjectProgress'] = this.idProjectProgress;
    data['content'] = this.content;
    data['percent'] = this.percent;
    data['worker'] = this.worker;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [id,idProjectProgress,content,percent,worker,createdAt,updatedAt];
}