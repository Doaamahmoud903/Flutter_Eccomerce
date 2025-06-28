import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';

abstract class AccountRepository{
  Future<Either<Failure ,AuthResponseEntity>>updateUserProfile(String name , String email ,String token);
  Future<Either<Failure ,AuthResponseEntity>>updatePassword(String currentPassword , String password , String rePassword ,String token);

}