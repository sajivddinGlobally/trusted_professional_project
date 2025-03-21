import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/home/model.home/homeServiceModel.dart';

part 'home.services.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class HomeServices {
  factory HomeServices(Dio dio, {String baseUrl}) = _HomeServices;

  @GET('/api/Service')
  Future<HomeServiceModel> getService();
}
