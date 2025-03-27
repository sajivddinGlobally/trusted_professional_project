import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/particularService/particulearProviderModel.dart';
import 'package:trusted_profissional_app/particularService/serviceParticular/particularProviderService.dart';

final particularServiceProvider = FutureProvider.family<
  ParticularServiceProviderModel,
  String
>((ref, id) async {
  final particularserviceprovider = ParticularProviderService(await getDio());
  return particularserviceprovider.particulerServiceProvider(id);
});
