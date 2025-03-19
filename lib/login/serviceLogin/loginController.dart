import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/login/loginModel/loginBodyModel.dart';
import 'package:trusted_profissional_app/login/loginModel/loginResModel.dart';
import 'package:trusted_profissional_app/login/serviceLogin/loginService.dart';

final loginProvider = FutureProvider.family<LoginResModel, LoginBodyModel>((
  ref,
  body,
) async {
  final loginservice = LoginService(await getDio());
  return loginservice.login(body);
});
