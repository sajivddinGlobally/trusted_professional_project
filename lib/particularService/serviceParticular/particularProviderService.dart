import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/particularService/particulearProviderModel.dart';

part 'particularProviderService.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class ParticularProviderService {
  factory ParticularProviderService(Dio dio, {String baseUrl}) =
      _ParticularProviderService;

  @GET('/api/service-providers/{id}')
  Future<ParticularServiceProviderModel> particulerServiceProvider(
    @Path('id') String id,
  );
}
