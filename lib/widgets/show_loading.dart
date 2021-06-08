import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
