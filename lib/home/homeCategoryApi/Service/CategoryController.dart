import 'package:riverpod/riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Service/CategoryService.dart';

final categoryProvider = FutureProvider((ref) async {
  final categoryservice = CategoryService(await getDio());
  return categoryservice.getCategory();
});

final subcategory = FutureProvider((ref) async {
  final service = CategoryService(await getDio());
  return service.fetchALLSubcategoty();
});

final filtersProvider = FutureProvider<Map<String, List<Map<String, dynamic>>>>(
  (ref) async {
    final service = CategoryService(await getDio());
    Map<String, dynamic> response = await service.fetchFiltes();
    Map<String, List<Map<String, dynamic>>> filters = {};
    response["data"].forEach((key, value) {
      filters[key] = List<Map<String, dynamic>>.from(value);
    });
    return filters;
  },
);
