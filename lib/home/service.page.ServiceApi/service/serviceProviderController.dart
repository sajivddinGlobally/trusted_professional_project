import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/service.page.ServiceApi/service/apiServiceProvider.dart';

// final serviceProviderController =
//     FutureProvider.family<ServiceProviderModel, String>((ref, id) async {
//       final apiserviceprovider = ApiServiceProvider(await getDio());
//       return apiserviceprovider.getServiceProvider(id);
//     });

final exmapleProvider = FutureProvider((ref) async {
  final exampleservice = ApiServiceProvider(await getDio());
  return exampleservice.getExample();
});
