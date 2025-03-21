import 'package:riverpod/riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/home.service/home.services.dart';
import 'package:trusted_profissional_app/home/model.home/homeServiceModel.dart';

final homeServiceProvider = FutureProvider<HomeServiceModel>((ref) async {
  final homeservice = HomeServices(await getDio());
  return homeservice.getService();
});
