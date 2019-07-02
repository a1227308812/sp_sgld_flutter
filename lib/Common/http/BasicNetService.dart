library basicnetservice;
export 'package:sp_sgld_flutter/NetService/ResultData.dart';

import 'package:sp_sgld_flutter/Common/local/LocalStorage.dart';
import 'package:sp_sgld_flutter/NetService/ServiceUtil.dart';
import 'dart:convert';
import 'Api.dart';

class BasicNetService extends ServiceUtil {
  String url;
  Method method;

  @override
  request(String url,
      {Method method,
      Object params,
      var file,
      String fileName,
      String fileSavePath}) {
    // TODO: implement request
    this.url = url;
    this.method = method;
    //98版的才这么用
//    Map newParams;
//    if (url != Api.uploadFile && params != null) {
//      newParams = {'jsonParam': jsonEncode(params)};
//    }
    return super.request(url,
        method: method,
        params: params,
        file: file,
        fileName: fileName,
        fileSavePath: fileSavePath);
  }

  //根据请求方式修改请求地址
  @override
  getBasicUrl() {
    // TODO: implement getBasicUrl
    String baseUrl;
    switch (this.method) {
      case Method.GET:
      case Method.POST:
        baseUrl = Api.baseUrl;
        break;
      case Method.UPLOAD:
        baseUrl = Api.baseUrl + Api.appUrl;
        break;
      case Method.DOWNLOAD:
        baseUrl = Api.baseUrl;
        break;
    }
    return baseUrl;
  }

  //复写获取header的方法
  @override
  getHeaders() async {
    // TODO: implement getHeaders
    String authKey = await LocalStorage.getString(LocalStorageKey.authKey);
    Map<String, dynamic> headers;
    switch (this.url) {
      case Api.login:
//      case Api.resetPwdByForget:
//      case Api.getPhoneCode:
        headers = null;
        break;
      default:
        headers = {'authKey': authKey};
        break;
    }
    return headers;
  }
}
