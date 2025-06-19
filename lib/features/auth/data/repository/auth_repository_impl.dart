import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';
import 'package:eccomerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:AuthRepository )
class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, AuthResponseEntity>> forgotPassword(String email) async{
   return await authRemoteDataSource.forgotPassword(email);
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
    String email,
    String password,
  ) async{
    return await authRemoteDataSource.login(email, password);
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
