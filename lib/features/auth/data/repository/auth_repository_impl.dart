import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:eccomerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';
import 'package:eccomerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:AuthRepository )
class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource , required this.authLocalDataSource});
  @override
  Future<Either<Failure, AuthResponseEntity>> forgotPassword(String email) async{
   return await authRemoteDataSource.forgotPassword(email);
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
      String email,
      String password,
      ) async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final loginResponse = await authRemoteDataSource.login(email, password);

      if (loginResponse.isRight()) {
        final authEntity = loginResponse.getOrElse(() => throw Exception("No user found"));
        await authLocalDataSource.saveUserInfo(email ,authEntity);
      }

      return loginResponse;
    } else {
      final cachedUser = await authLocalDataSource.getUserInfo(email, password);
      if (cachedUser != null) {
        return Right(cachedUser);
      } else {
        return Left(NetworkFailure("No cached user found"));
      }
    }
  }


  @override
  Future<Either<Failure, AuthResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async{
   return await authRemoteDataSource.register(name, email, password, rePassword, phone);
  }
}
