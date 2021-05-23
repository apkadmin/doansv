import 'package:flutter/material.dart';
import 'package:quanly_app/constants.dart';
import 'package:quanly_app/models/teacher.model.dart';

class TeacherInfo extends StatelessWidget {
  final Teacher teacher;

  const TeacherInfo({Key key, this.teacher}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin giáo viên"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: [
                Image(
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 3,
                  image: NetworkImage(
                      'https://i.ytimg.com/vi/acjm6bMbIG8/maxresdefault.jpg'),
                ),
                Positioned(
                  bottom: -50,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://st.quantrimang.com/photos/image/2017/04/08/anh-dai-dien-FB-200.jpg'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                teacher.level + ". " + teacher.name,
                style: kActiveTabStyle.copyWith(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                teacher.workspace,
                style: kCategoryTitle.copyWith(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      teacher.phone,
                      style: kActiveTabStyle.copyWith(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        teacher.email,
                        style: kActiveTabStyle.copyWith(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
