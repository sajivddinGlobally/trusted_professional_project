import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trusted_profissional_app/login/login.page.dart';
import 'package:trusted_profissional_app/signUp/registerModel/registerResModel.dart';
import 'package:http/http.dart' as http;

class Apicontroller {
  static Future<RegistorResModel> registerUser(
    context, {
    required String name,
    required String email,
    required String phone,
    required File imageFile,
    required String aadhar,
    required File video,
    required String user_type,
    required Function ifError,
  }) async {
    final Uri url = Uri.parse(
      'http://skilzaar.laravel.globallywebsolutions.com/api/register',
    );
    if (imageFile == null || video == null) {
      Fluttertoast.showToast(msg: "Please select image");
      throw Exception("Image or video missing");
    }

    var request = http.MultipartRequest("POST", url);
    request.headers.addAll({
      // "Content-Type": "application/json",
      "Accept": "application/json",
    });
    request.files.add(
      await http.MultipartFile.fromPath('image', imageFile.path),
    );
    request.files.add(await http.MultipartFile.fromPath('video', video.path));

    // add this fields
    request.fields.addAll({
      "name": name,
      "email": email,
      "phone": phone,
      "aadhar": aadhar,
      "user_type": user_type,
    });

    try {
      print("Sending registerUser request...");
      print("Fields: ${request.fields}");
      print("Files: ${request.files.map((f) => f.filename).toList()}");
      final http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();
      log(responseBody);
      Map<String, dynamic> data = jsonDecode(responseBody);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$name your account was created")),
        );
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => Login()),
          (route) => false,
        );
        return RegistorResModel.fromJson(jsonDecode(responseBody));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${data["message"].toString()}")),
        );
        ifError();
        throw Exception("Failed to register: ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  static Future<RegistorResModel> register(
    context, {
    required String name,
    required String email,
    required String phone,
    required String user_type,
    required Function ifError,
  }) async {
    final Uri url = Uri.parse(
      'http://skilzaar.laravel.globallywebsolutions.com/api/register',
    );

    var request = http.MultipartRequest("POST", url);
    request.headers.addAll({
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    request.fields.addAll({
      "name": name,
      "email": email,
      "phone": phone,
      "user_type": user_type,
    });

    try {
      final http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();
      log(responseBody);
      Map<String, dynamic> data = jsonDecode(responseBody);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$name your account was created")),
        );
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => Login()),
          (route) => false,
        );
        return RegistorResModel.fromJson(jsonDecode(responseBody));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${data["message"].toString()}")),
        );
        ifError();
        throw Exception("Failed to register: ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
