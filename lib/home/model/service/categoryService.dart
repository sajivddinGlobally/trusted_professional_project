import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/home/model/categoaryResModel.dart';

part 'categoryService.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  @POST('/api/category-store')
  @MultiPart()
  Future<HomeCategoryResModel> multipartCategory(
    @Part(name: 'name') String name,
    @Part(name: 'file') File file,
  );
}
