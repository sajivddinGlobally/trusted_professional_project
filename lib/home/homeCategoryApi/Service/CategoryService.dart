import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Model/CategoryModel.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Model/subcategory.model.dart';

part 'CategoryService.g.dart';

@RestApi(baseUrl: 'http://skilzaar.laravel.globallywebsolutions.com')
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  @GET('/api/category')
  Future<CategoryModel> getCategory();
  @GET('/api/sub-categories/{id}')
  Future<SubCategoryModel> fetchSubcategoty(@Path("id") String id);
  @GET('/api/sub-categories')
  Future<SubCategoryModel> fetchALLSubcategoty();
  @GET('/api/filtered-subcategories')
  Future<Map<String, dynamic>> fetchFiltes();
}
