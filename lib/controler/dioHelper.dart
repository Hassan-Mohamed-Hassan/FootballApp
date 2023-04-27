import 'package:dio/dio.dart';

class DioHelper{
 static Dio ?dio;
 static void init(){
  dio=Dio(
   BaseOptions(
    baseUrl: 'https://football98.p.rapidapi.com/',
    receiveDataWhenStatusError: true,
   )
  );
 }
 static Future<Response> getData(quary)async{
  dio!.options.headers={
   'content-type': 'application/octet-stream',
   'X-RapidAPI-Key': '5f0e01195bmshb6bd2af47cdfd99p135eb1jsnf01bca48b63f',
   'X-RapidAPI-Host': 'football98.p.rapidapi.com'
  };
  return await dio!.get(quary);
 }
}