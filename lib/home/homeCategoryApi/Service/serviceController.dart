import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Model/serviceModel.dart';
import 'package:trusted_profissional_app/home/homeCategoryApi/Service/services.service.dart';

final serviceController = FutureProvider<ServiceModel>((ref) async {
  final services = ServicesService(await getDio());
  return services.fetchService();
});
