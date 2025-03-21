import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/home/service.page.category/categoryModel.dart';

part 'serviceCategory.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class ServiceCategory {
  factory ServiceCategory(Dio dio, {String baseUrl}) = _ServiceCategory;

  @GET('/api/category')
  Future<CategoryModel> getCategory();
}
