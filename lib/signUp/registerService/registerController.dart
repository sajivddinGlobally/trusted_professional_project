import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/signUp/registerModel/registerBodyModel.dart';
import 'package:trusted_profissional_app/signUp/registerModel/registerResModel.dart';
import 'package:trusted_profissional_app/signUp/registerService/registerService.dart';

final registerProvider =
    FutureProvider.family<RegisterResModel, RegisterBodyModel>((
      ref,
      body,
    ) async {
      final registerservice = RegisterService(await getDio());
      return registerservice.register(body);
    });
