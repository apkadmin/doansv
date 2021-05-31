
import 'package:flutter/material.dart';


class DiaLogOverTime extends StatelessWidget {
final String title;
final Function function;

  const DiaLogOverTime( this.title, this.function,{Key key,}) : super(key: key);
  dialogContent(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(19),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               SizedBox(
                height: 16,
              ),
              Text(
               'Thông báo',
                textAlign: TextAlign.center,
                style:TextStyle(fontSize: 20,color: Colors.black12),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
               "Đăng ký thành công",
                textAlign: TextAlign.center,
                style:TextStyle(fontSize: 16,color: Colors.black12),
              ),
              SizedBox(
                height: 40,
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextButton(

                   style: TextButton.styleFrom(
                     minimumSize:Size(double.infinity,50),
                      alignment: Alignment.center
                       ),
                    onPressed: function,
                    child: Text(
                        "OK",
                        style: TextStyle(fontSize: 16,color: Colors.black12),
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return dialogContent(context);
  }
}