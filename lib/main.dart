import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:eccomerce_app/core/cach_helper/cach_helper.dart';
import 'core/di/di.dart';
import 'core/state_management/bloc_observer.dart';
import 'eccomerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await CacheHelper().initPrefs();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const EccomerceApp());
}
