import 'package:riverpod/riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/service.page.category/categoryModel.dart';
import 'package:trusted_profissional_app/home/service.page.category/serviceCategory.dart';

final categoryProvider = FutureProvider<CategoryModel>((ref) async {
  final categoryservice = ServiceCategory(await getDio());
  return categoryservice.getCategory();
});
