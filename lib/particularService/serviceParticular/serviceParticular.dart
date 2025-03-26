import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/particularService/Model.Particular/particularServiceModel.dart';

part 'serviceParticular.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class ServiceParticular {
  factory ServiceParticular(Dio dio, {String baseUrl}) = _ServiceParticular;

  @GET('/api/particular-service')
  Future<ParticularServiceModel> getParticularService();
}
