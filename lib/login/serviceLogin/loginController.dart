// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:trusted_profissional_app/config/pretty.dio.dart';
// // import 'package:trusted_profissional_app/login/loginModel/loginBodyModel.dart';
// // import 'package:trusted_profissional_app/login/loginModel/loginResModel.dart';
// // import 'package:trusted_profissional_app/login/serviceLogin/loginService.dart';

// // final loginProvider = FutureProvider.family<LoginResModel, LoginBodyModel>((
// //   ref,
// //   body,
// // ) async {
// //   final loginservice = LoginService(await getDio());
// //   return loginservice.login(body);
// // });

// //Login Controller class
// import 'dart:developer';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive/hive.dart';
// import 'package:trusted_profissional_app/config/pretty.dio.dart';
// import 'package:trusted_profissional_app/login/loginModel/loginBodyModel.dart';
// import 'package:trusted_profissional_app/login/serviceLogin/loginService.dart';
// import 'package:trusted_profissional_app/login/serviceLogin/loginstate.dart';
// import 'package:trusted_profissional_app/signUp/registerModel/registerResModel.dart';

// class Logincontroller extends StateNotifier<Loginstate> {
//   Logincontroller() : super(LoginInitial());

//   //Login method
//   Future<void> login(LoginBodyModel body) async {
//     log("Login process started"); // Log the start of the login process

//     try {
//       state = LoginLoading(); // Set state to loading

//       // Initialize Dio and LoginService
//       final dio = await getDio();
//       final loginservice = LoginService(dio);

//       //call the login api
//       final response = await loginservice.login(body);

//       // Set state to success with the response
//       state = LoginSuccess(response);
//       log("Login successful: ${response.toString()}"); // login success
//     } catch (e) {
//       // Handle errors and set state to error

//       state = LoginError(e.toString());
//       log("Login failed: ${e.toString()}");
//     }
//   }
// }

// // StateNotifierProvider for LoginController
// final loginProvider = StateNotifierProvider<Logincontroller, Loginstate>(
//   (ref) => Logincontroller(),
// );
