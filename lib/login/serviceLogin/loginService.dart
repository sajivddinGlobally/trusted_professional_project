import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/login/loginModel/loginBodyModel.dart';
import 'package:trusted_profissional_app/login/loginModel/loginResModel.dart';

part 'loginService.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/api/login-send-otp')
  Future<LoginResModel> login(@Body() LoginBodyModel body);
}
