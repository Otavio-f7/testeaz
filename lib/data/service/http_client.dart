import 'package:dio/dio.dart';

abstract class  IHttpClient {
  Future get({required String url});

  factory IHttpClient(){
    return DioClient();
  }
}

class DioClient implements IHttpClient{
  final client = Dio();
  @override
  Future get({required String url}) async   {
    return await client.get(url);
  }
}