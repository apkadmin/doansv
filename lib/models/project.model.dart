class Project {
  final String id;
  final String name;
  final String projectRequest;
  final String projectContent;
  final String majors;
  final String idTeacher;
  final String idStudent;
  final String nameTeacher;
  final bool state;

  Project.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        projectRequest = json['projectRequest'],
        projectContent = json['projectContent'],
        majors = json['majors'],
        idTeacher = json['idTeacher'],
        nameTeacher = json['nameTeacher'],
        state = json['state'],
        idStudent = json['idStudent'];
}
