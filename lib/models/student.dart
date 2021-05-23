class Student {
  final String id;
  final String name;
  final String birthday;
  final String address;
  final String phone;
  final String code;
  final String email;
  final String idClass;
  final String majors;
  final String schoolYear;
  final String image;

  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        birthday = json['birthday'],
        address = json['address'],
        phone = json['phone'],
        code = json['code'],
        email = json['email'],
        idClass = json['idClass'],
        majors = json['majors'],
        schoolYear = json['schoolYear'],
        image = json['image'];
}
