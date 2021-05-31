import 'package:equatable/equatable.dart';

class DetailProject extends Equatable {
  String name;
  String nameTeacher;
  String phoneTeacher;
  String emailTeacher;
  String workspaceTeacher;
  String majors;
  String nameStudent;
  String phoneStudent;
  String emailStudent;
  String projectContent;
  String projectRequest;

  DetailProject(
      {this.name,
      this.nameTeacher,
      this.phoneTeacher,
      this.emailTeacher,
      this.workspaceTeacher,
      this.majors,
      this.nameStudent,
      this.phoneStudent,
      this.emailStudent,
      this.projectContent,
      this.projectRequest});

  DetailProject.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameTeacher = json['nameTeacher'];
    phoneTeacher = json['phoneTeacher'];
    emailTeacher = json['emailTeacher'];
    workspaceTeacher = json['workspaceTeacher'];
    majors = json['majors'];
    nameStudent = json['nameStudent'];
    phoneStudent = json['phoneStudent'];
    emailStudent = json['emailStudent'];
    projectContent = json['projectContent'];
    projectRequest = json['projectRequest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nameTeacher'] = this.nameTeacher;
    data['phoneTeacher'] = this.phoneTeacher;
    data['emailTeacher'] = this.emailTeacher;
    data['workspaceTeacher'] = this.workspaceTeacher;
    data['majors'] = this.majors;
    data['nameStudent'] = this.nameStudent;
    data['phoneStudent'] = this.phoneStudent;
    data['emailStudent'] = this.emailStudent;
    data['projectContent'] = this.projectContent;
    data['projectRequest'] = this.projectRequest;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        name,
        nameTeacher,
        nameStudent,
        projectRequest,
        projectContent,
        emailTeacher,
        emailStudent,
        majors,
        phoneStudent,
        phoneTeacher,workspaceTeacher
      ];
}
