import 'package:flutter/material.dart';
import 'package:quanly_app/models/student.dart';

import 'package:rxdart/rxdart.dart';

import 'hive_utils.dart';

class GlobalCache {
  static GlobalCache _instance;

  factory GlobalCache() => _instance ??= new GlobalCache._();

  GlobalCache._();

  final refreshController = BehaviorSubject();
  bool isShowDialogNoInternet = false;
  bool isShowDialogInvalidToken = false;
  String _token;
  Student _userModel;

  Student getUser() {
    return _userModel;
  }

  String getToken() {
    return _token ?? "9497d939bf95f9f81fb3bbf540baa522";
  }

  void setToken(String _member) {
    this._token = _member;
  }

  void setUser(Student model) {
    HiveUtils.shared.setUserData(model);
    this._userModel = model;
  }
}
