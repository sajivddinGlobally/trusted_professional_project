import 'package:riverpod/riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Service/CategoryService.dart';

final categoryProvider = FutureProvider((ref) async {
  final categoryservice = CategoryService(await getDio());
  return categoryservice.getCategory();
});
