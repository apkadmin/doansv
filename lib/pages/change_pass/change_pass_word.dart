import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanly_app/pages/change_pass/bloc/change_pass_bloc.dart';
import 'package:quanly_app/widgets/showMessage.dart';

class ChangePassWord extends StatefulWidget {
  const ChangePassWord({Key key}) : super(key: key);

  @override
  _ChangePassWordState createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  TextEditingController _oldPassWord = TextEditingController();
  TextEditingController _newPass = TextEditingController();
  TextEditingController _confirmNewPass = TextEditingController();
  ChangePassBloc changePassBloc;
  int count = 0;

  @override
  void initState() {
    changePassBloc = context.read();
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePassBloc, ChangePassState>(
        listener: (context, state) {
      if (state is ChangePassLoading) {
        showLoading(context);
      } else if (state is ChangePassLoaded) {
        Navigator.of(context).popUntil((_) => count++ >= 2);
      } else if (state is ChangePassError) {
        Navigator.pop(context);
        showMessage(context, "Mật khẩu cũ không đúng");
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 24,
                        )),
                    Text(
                      "Đổi mật khẩu",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )
                  ]),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    controller: _oldPassWord,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Old Pass",
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15)),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    controller: _newPass,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "New Pass",
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15)),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    controller: _confirmNewPass,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Comfirm New PassWord",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed: () {
                        if (_newPass.value.text == _confirmNewPass.value.text) {
                          context.read<ChangePassBloc>().add(RequestChangePass(
                              oldPass: _oldPassWord.value.text,
                              newPass: _newPass.value.text));
                        }
                        else{
                           showMessage(context,"Mật khẩu không trùng nhau" );
                        }
                      },
                      child: Text("Đổi mật khẩu",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (c) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                height: 70,
                width: 70,
                child: CupertinoActivityIndicator(),
              ),
            ),
          );
        });
  }
}
