import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/particularService/serviceParticular/serviceParticular.dart';

final particularServiceProvider = FutureProvider((ref) async {
  final serviceparticular = ServiceParticular(await getDio());
  return serviceparticular.getParticularService();
});
