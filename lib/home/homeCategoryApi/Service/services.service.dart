import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Model/serviceModel.dart';

part 'services.service.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class ServicesService {
  factory ServicesService(Dio dio, {String baseUrl}) = _ServicesService;

  @GET('/api/services-providers')
  Future<ServiceModel> fetchService();
}
