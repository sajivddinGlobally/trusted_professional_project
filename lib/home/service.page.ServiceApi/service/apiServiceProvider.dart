import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/home/service.page.ServiceApi/Model/serviceProviderModel.dart';
import 'package:trusted_profissional_app/particularService/particulearProviderModel.dart';

part 'apiServiceProvider.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class ApiServiceProvider {
  factory ApiServiceProvider(Dio dio, {String baseUrl}) = _ApiServiceProvider;

  @GET('/api/services-providers?sub_category_id={id}')
  Future<ServiceProviderModel> getServiceProvider(@Path('id') String id);

  @GET('/api/service-providers/{id}')
  Future<ParticularServiceProviderModel> particulearServiceProvider(
    @Path('id') String id,
  );


}
