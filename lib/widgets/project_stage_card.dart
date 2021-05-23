import 'package:flutter/material.dart';

class ProjectStageCard extends StatelessWidget {
  final String title;

  const ProjectStageCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(title),
            flex: 3,
          ),
          Expanded(
            child: Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
