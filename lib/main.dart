import 'package:bagstore/Core/api/api_services.dart';
import 'package:bagstore/Core/Uitls/bloc_observer.dart';
import 'package:bagstore/Core/Uitls/_functions.dart';
import 'package:bagstore/Core/Uitls/local_services.dart';
import 'package:bagstore/Core/Uitls/service_locator.dart';
import 'package:bagstore/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await LocalServices.init();
  fetchDataFromLocalStorage();
  ApiServices.init();
  runApp(const BgaStore());
}
