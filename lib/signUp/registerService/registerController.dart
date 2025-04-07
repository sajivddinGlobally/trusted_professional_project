// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:trusted_profissional_app/config/pretty.dio.dart';
// import 'package:trusted_profissional_app/signUp/registerModel/registerBodyModel.dart';
// import 'package:trusted_profissional_app/signUp/registerModel/registerResModel.dart';
// import 'package:trusted_profissional_app/signUp/registerService/registerService.dart';

// final registerProviderController =
//     FutureProvider.family<RegistorResModel, RegistorBodyModel>((
//       ref,
//       body,
//     ) async {
//       final registerservice = RegisterService(await getDio());
//       return registerservice.register(body);
//     });

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFormDataModel {
  final String user_type;

  MyFormDataModel({required this.user_type});

  MyFormDataModel copyWith({String? user_type}) {
    return MyFormDataModel(user_type: user_type ?? this.user_type);
  }
}

class FormDataNotifier extends StateNotifier<MyFormDataModel> {
  FormDataNotifier() : super(MyFormDataModel(user_type: ''));

  void updateUserType(String userType) {
    state = state.copyWith(user_type: userType);
  }
}

final formDataProvider =
    StateNotifierProvider<FormDataNotifier, MyFormDataModel>(
      (ref) => FormDataNotifier(),
    );
