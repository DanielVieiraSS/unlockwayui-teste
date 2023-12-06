// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/constants.dart';

Future<Map<String, dynamic>> getHomeAnalysysAPI(BuildContext context) async {
  var sessionToken = userData.token;
  const String apiUrl = 'https://unlockway.azurewebsites.net/api/v1/analysis';

  final response = await http.get(
      Uri.parse(apiUrl).replace(queryParameters: {
        'userId': userData.id,
      }),
      headers: {
        'Authorization': 'Bearer $sessionToken',
      });

  var analysisResult = json.decode(response.body);

  return analysisResult;
}
