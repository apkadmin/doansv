class News {
  final String id;
  final String title;
  final String subTitle;
  final String idImageUrl;
  final String content;
  final int type;
  // final bool status;
  final String description;
  final int view;
  final String created_at;

  News.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        subTitle = json['subTitle'],
        idImageUrl = json['idImageUrl'],
        content = json['content'],
        type = json['type'],
        // status = json['status'],
        description = json['description'],
        view = json['view'],
        created_at = json['created_at'];
}
