import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trusted_profissional_app/config/pretty.dio.dart';
import 'package:trusted_profissional_app/home/model/categoaryResModel.dart';
import 'package:trusted_profissional_app/home/model/service/categoryService.dart';

final multipartProvider = FutureProvider.family<HomeCategoryResModel, File>((
  ref,
  file,
) async {
  final categorservice = CategoryService(await getDio());
  return categorservice.multipartCategory("My Image", file);
});
