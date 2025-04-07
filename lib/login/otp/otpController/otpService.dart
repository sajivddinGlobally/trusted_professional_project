import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/login/otp/otpBodyModel.dart';
import 'package:trusted_profissional_app/login/otp/otpResModel.dart';

part 'otpService.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class OtpService {
  factory OtpService(Dio dio, {String baseUrl}) = _OtpService;

  @POST('/api/login-verify-otp')
  Future<OtpResModel> verifyOtp(@Body() OtpBodyModel body);
}
