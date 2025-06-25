import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );

  Future<Either<Failure, AuthResponseEntity>> login(
    String email,
    String password,
  );

  Future<Either<Failure, AuthResponseEntity>> forgotPassword(String email);
  Future<Either<Failure, AuthResponseEntity>> resetCode(String resetCode);
  Future<Either<Failure, AuthResponseEntity>> resetPassword(String email , String newPassword);


}
