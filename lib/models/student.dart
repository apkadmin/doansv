

import 'package:hive/hive.dart';
part 'student.g.dart';
@HiveType(typeId: 0)
class Student extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String username;
  @HiveField(2)
  String email;
  @HiveField(3)
  String role;
  @HiveField(4)
  String accessToken;
  @HiveField(5)
  String idStudent;
  @HiveField(6)
  String nameStudent;
  @HiveField(7)
  String birthday;
  @HiveField(8)
  String address;
  @HiveField(9)
  String phone;
  @HiveField(10)
  String code;
  @HiveField(11)
  String idClass;
  @HiveField(12)
  String majors;
  @HiveField(13)
  String schoolYear;
  @HiveField(14)
  String image;
  @HiveField(15)
  String idProject;

  Student(
      {this.id,
        this.username,
        this.email,
        this.role,
        this.accessToken,
        this.idStudent,
        this.nameStudent,
        this.birthday,
        this.address,
        this.phone,
        this.code,
        this.idClass,
        this.majors,
        this.schoolYear,
        this.image,
        this.idProject});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    accessToken = json['accessToken'];
    idStudent = json['idStudent'];
    nameStudent = json['nameStudent'];
    birthday = json['birthday'];
    address = json['address'];
    phone = json['phone'];
    code = json['code'];
    idClass = json['idClass'];
    majors = json['majors'];
    schoolYear = json['schoolYear'];
    image = json['image'];
    idProject = json['idProject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['role'] = this.role;
    data['accessToken'] = this.accessToken;
    data['idStudent'] = this.idStudent;
    data['nameStudent'] = this.nameStudent;
    data['birthday'] = this.birthday;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['code'] = this.code;
    data['idClass'] = this.idClass;
    data['majors'] = this.majors;
    data['schoolYear'] = this.schoolYear;
    data['image'] = this.image;
    data['idProject'] = this.idProject;
    return data;
  }
}