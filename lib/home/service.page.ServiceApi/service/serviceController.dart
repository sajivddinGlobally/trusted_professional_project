import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/service.page.ServiceApi/Model/serviceModel.dart';
import 'package:trusted_profissional_app/home/service.page.ServiceApi/service/apiService.dart';

final serviceProvider = FutureProvider((ref) async {
  final apiservice = ApiService(await getDio());
  return apiservice.getService();
});

final particularServiceProvider = FutureProvider.family<ServiceModel, String>((
  ref,
  id,
) async {
  final apiservice = ApiService(await getDio());
  return apiservice.getParticularService(id);
});
