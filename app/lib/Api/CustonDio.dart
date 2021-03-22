import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustonDio {
  // instacia do dio
  var _dio;

  // sem jwt
  CustonDio() {
    _dio = Dio();
  }

  //com jwt
  CustonDio.withAuthentication() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onRespose, onError: _onError));
  }

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    options.headers['Authorization'] = token;
  }

  _onError(DioError e) {
    return e;
  }

  _onRespose(Response e) {
    print('########### Response Log');
    print(e.data);
    print('########### Response Log');
  }
}
