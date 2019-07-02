import 'package:dio/dio.dart';
import 'dart:io';

/**
 * Created by ZWP on 2019/7/1 16:46.
 * 描述：dio基础设置
 */
class ServiceSessionManager extends Dio {
  static const String CONTENT_TYPE_JSON = "application";
  static const String CONTENT_TYPE_FORM = "x-www-form-urlencoded";
  static const String CONTENT_CHART_SET = 'utf-8';

  // 工厂模式
  factory ServiceSessionManager() => _getInstance();

  static ServiceSessionManager get instance => _getInstance();
  static ServiceSessionManager _instance;

  ServiceSessionManager._internal() {
    // 初始化
  }

  //设置基础参数信息
  static ServiceSessionManager _getInstance() {
    if (_instance == null) {
      _instance = ServiceSessionManager._internal();
      BaseOptions options = BaseOptions(
        //服务器连接超时时间  15s
        connectTimeout: 15000,
        //接收数据的最长时限  15s
        receiveTimeout: 15000,
        //返回数据类型设置
        responseType: ResponseType.json,

        /// 请求的Content-Type，默认值是[ContentType.JSON].
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `ContentType.parse("application/x-www-form-urlencoded")`,  这样[Dio]
        /// 就会自动编码请求体.
        contentType: ContentType(CONTENT_TYPE_JSON, CONTENT_TYPE_FORM,
            charset: CONTENT_CHART_SET),
      );
      _instance.options = options;
      //如果是debug模式下就开启打印日志
      if (true) {
        _instance.interceptors.add(InterceptorsWrapper(
            onRequest: (RequestOptions options){
              print("\n================== 请求数据 ==========================");
              print("url = ${options.uri.toString()}");
              print("headers = ${options.headers}");
              print("params = ${options.data}");
            },
            onResponse: (Response response){
              print("\n================== 响应数据 ==========================");
              print("code = ${response.statusCode}");
              print("data = ${response.data}");
              print("\n");
            },
            onError: (DioError e){
              print("\n================== 错误响应数据 ======================");
              print("type = ${e.type}");
              print("message = ${e.message}");
            }
        ));
      }

    }
    return _instance;
  }
}
