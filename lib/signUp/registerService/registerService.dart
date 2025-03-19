import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:trusted_profissional_app/signUp/registerModel/registerBodyModel.dart';
import 'package:trusted_profissional_app/signUp/registerModel/registerResModel.dart';

part 'registerService.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class RegisterService {
  factory RegisterService(Dio dio, {String baseUrl}) = _RegisterService;

  @POST('/api/register')
  Future<RegisterResModel> register(@Body() RegisterBodyModel body);
}
