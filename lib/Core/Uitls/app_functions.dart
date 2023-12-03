import 'package:bagstore/Core/Uitls/app_constants.dart';
import 'package:bagstore/Core/Uitls/local_services.dart';
import 'package:bagstore/config/routes/routes.dart';
import 'package:flutter/material.dart';

void submited(BuildContext context) {
  LocalServices.saveData(
    key: 'onbording',
    value: true,
  ).then((value) {
    if (value) {
      pushAndFinsh(context, pageName: Routes.authViewRoute);
    }
  });
}

void pushAndFinsh(BuildContext context, {required String pageName}) {
  Navigator.pushNamedAndRemoveUntil(context, pageName, (route) => false);
}

void pushOnly(BuildContext context, {required String pageName}) {
  Navigator.pushNamed(context, pageName);
}

Future<Map<String, dynamic>> fetchDataFromLocalStorage() async {
  onBording = await LocalServices.getData(key: 'onbording');
  token = await LocalServices.getData(key: 'token');

  // You can return the values as a Map or use a custom class to represent the result
  return {'onBording': onBording, 'token': token};
}
