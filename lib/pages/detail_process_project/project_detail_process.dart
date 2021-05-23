import 'package:flutter/material.dart';
import 'package:quanly_app/constants.dart';

class DetailProcessProject extends StatefulWidget {
  @override
  DetailProcessProjectState createState() => DetailProcessProjectState();
}

class DetailProcessProjectState extends State<DetailProcessProject> {
  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                  itemCount: 1,
                  scrollDirection: Axis.vertical,

                  itemBuilder: (context, index) {
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
                            Text("1",style: kTitleCard.copyWith(fontSize: 12),textAlign: TextAlign.center,),
                            Text("Lap trinh",style: kTitleCard.copyWith(fontSize: 12)),
                            Text("Minh Veo An",style: kTitleCard.copyWith(fontSize: 12)),
                            Text("10",style: kTitleCard.copyWith(fontSize: 12)),

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
}
