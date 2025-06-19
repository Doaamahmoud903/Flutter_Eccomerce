import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class DioFactory {
  @lazySingleton
  Dio dio() => Dio();
}
