class Teacher {
  final String id;
  final String name;
  final String level;
  final String birthday;
  final String address;
  final String phone;
  final String email;
  final String image;
  final String workspace;
  final String description;

  Teacher.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        level = json['level'],
        birthday = json['birthday'],
        address = json['address'],
        phone = json['phone'],
        email = json['email'],
        image = json['image'],
        workspace = json['workspace'],
        description = json['description'];
}
