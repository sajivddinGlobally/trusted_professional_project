import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/login/otp/otpBodyModel.dart';
import 'package:trusted_profissional_app/login/otp/otpController/otpService.dart';
import 'package:trusted_profissional_app/login/otp/otpResModel.dart';

final otpProvider = FutureProvider.family<OtpResModel, OtpBodyModel>((
  ref,
  body,
) async {
  final otpservice = OtpService(await getDio());
  return otpservice.verifyOtp(body);
});
