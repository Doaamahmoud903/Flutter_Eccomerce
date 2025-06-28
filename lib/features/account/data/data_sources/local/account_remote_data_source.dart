import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../auth/domain/entities/auth_response_entity.dart';

abstract class AccountRemoteDataSource{
  Future<Either<Failure ,AuthResponseEntity>>updateUserProfile(String name , String email , String token);
  Future<Either<Failure ,AuthResponseEntity>>updatePassword(String currentPassword , String password , String rePassword ,String token);
}