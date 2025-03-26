import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/home/service.page.ServiceApi/Model/serviceModel.dart';

part 'apiService.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/api/Service')
  Future<ServiceModel> getService();

  @GET('/api/particular-service/{id}')
  Future<ServiceModel> getParticularService(@Path() String id);
}
