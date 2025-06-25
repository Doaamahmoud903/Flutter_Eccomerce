import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:eccomerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';
import 'package:eccomerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/connectivity/handle_network_request.dart';


@Injectable(as:AuthRepository )
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final Connectivity connectivity;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, AuthResponseEntity>> forgotPassword(String email) async{
   return await handleRepoNetworkRequest(
       onlineRequest: ()async{
         return authRemoteDataSource.forgotPassword(email);
       }, connectivity: connectivity
   );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
      String email,
      String password,
      ) async {
    return await handleRepoNetworkRequest<AuthResponseEntity>(
      connectivity: connectivity,
      onlineRequest: () async {
        final loginResponse = await authRemoteDataSource.login(email, password);

        if (loginResponse.isRight()) {
          final authEntity = loginResponse.getOrElse(
                  () => throw Exception("No user found"));
          await authLocalDataSource.saveUserInfo(email, authEntity);
        }

        return loginResponse;
      },
      offlineRequest: () async {
        final cachedUser =
        await authLocalDataSource.getUserInfo(email, password);
        if (cachedUser != null) {
          return Right(cachedUser);
        } else {
          return Left(NetworkFailure("No cached user found"));
        }
      },
    );
  }


  @override
  Future<Either<Failure, AuthResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async{

   return await handleRepoNetworkRequest(
     connectivity: connectivity,
     onlineRequest: ()async{
      final registerResponse = authRemoteDataSource.register(name, email, password, rePassword, phone);
      return registerResponse;
     },
       );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> resetCode(
      String resetCode,
      ) async{

    return await handleRepoNetworkRequest(
      connectivity: connectivity,
      onlineRequest: ()async{
        final registerResponse = authRemoteDataSource.resetCode(resetCode);
        return registerResponse;
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> resetPassword(
      String email,
      String newPassword
      ) async{

    return await handleRepoNetworkRequest(
      connectivity: connectivity,
      onlineRequest: ()async{
        final registerResponse = authRemoteDataSource.resetPassword(email, newPassword);
        return registerResponse;
      },
    );
  }
}
