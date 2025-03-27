import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/service.page.ServiceApi/service/apiServiceProvider.dart';

final serviceProviderController = FutureProvider((ref) async {
  final apiserviceprovider = ApiServiceProvider(await getDio());
  return apiserviceprovider.getServiceProvider();
});

