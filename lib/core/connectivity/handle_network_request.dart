import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../errors/failures.dart';


Future<Either<Failure, T>> handleRepoNetworkRequest<T>({
  required Future<Either<Failure, T>> Function() onlineRequest,
  Future<Either<Failure, T>> Function()? offlineRequest,
  required Connectivity connectivity,
}) async {
  final connectivityResult = await connectivity.checkConnectivity();

  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    return await onlineRequest();
  } else {
    if (offlineRequest != null) {
      return await offlineRequest();
    } else {
      return Left(NetworkFailure("No internet connection"));
    }
  }
}

Future<T> handleDataNetworkRequest<T>({
  required Connectivity connectivity,
  required Future<T> Function() request,
}) async {
  final connectivityResult = await connectivity.checkConnectivity();

  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    return await request();
  } else {
    throw NetworkFailure("No Internet Connection");

  }
}

