
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioApiProvider{

  Future<dynamic> getApiCalls({
    required String urlString,
    Map<String,dynamic>? params,
    Map<String,dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try{
      var response;
      if(headers != null){
        response = await Dio().get(urlString,queryParameters: params,data: body,options: Options(
            headers: headers
        )) ;
      }else{
        response = await Dio().get(urlString,queryParameters: params,data: body);
      }
      if(response.statusCode == 200){
        print("API CALL SUCCESS ${(response.data).runtimeType}");
        return response.data;
      }else{
        print("API CALL FAILED");
      }
    }on DioException catch (error){
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {

        print("~~~~~~~~~~~~~Connection Timeout Exception~~~~~~~~~~~~~");
        // Handle timeout error
      } else if (error.type == DioExceptionType.badResponse) {
        print("~~~~~~~~~~~~~Bad Response Exception~~~~~~~~~~~~~");
        // Handle non-2xx response errors
      } else if (error.type == DioErrorType.cancel) {
        print("~~~~~~~~~~~~~Request Cancelled Exception~~~~~~~~~~~~~");
        // Handle request cancellation
      } else {
        print("~~~~~~~~~~~Unhandled Exception~~~~~~~~~~~~~");
      }
    }
  }

}