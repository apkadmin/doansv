import 'package:flutter/material.dart';
import 'package:quanly_app/models/project.model.dart';
import 'package:quanly_app/pages/list/project_detail.dart';
import 'package:quanly_app/widgets/project_cart.dart';

class SearchPage extends StatefulWidget {
  List<Project> project;

  SearchPage({Key key, this.project}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Project> listProject ;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
       listProject = widget.project;
       super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    onChanged: (value){
                      setState(() {
                        listProject = widget.project
                            .where((element) => element.name
                            .toUpperCase()
                            .contains(value.toUpperCase()))
                            .toList();
                      });
                    },
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: listProject.length ?? 0,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    Project _project = listProject[index];
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProjectDetail(
                                        project: _project,
                                      )));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 130.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 8.0),
                          child: ProjectCard(project: _project),
                        ));
                  },
                  // separatorBuilder: (context, index) => Divider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
