import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/features/account/data/data_sources/remote/account_remote_data_source.dart';
import 'package:eccomerce_app/features/account/domain/repository/account_repository.dart';
import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/api/api_constant.dart';
import '../../../../core/cach_helper/cach_helper.dart';
import '../../../../core/connectivity/handle_network_request.dart';
import '../../../../core/di/di.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/data/data_sources/local/auth_local_data_source.dart';


@Injectable(as: AccountRepository )
class AccountRepositoryImpl extends AccountRepository{
  final AccountRemoteDataSource accountRemoteDataSource;
  final Connectivity connectivity;
  AccountRepositoryImpl(this.accountRemoteDataSource ,{required this.connectivity});


  @override
  Future<Either<Failure, AuthResponseEntity>> updatePassword(String currentPassword, String password, String rePassword ,String token) async{
   return await handleRepoNetworkRequest(
       onlineRequest: () async{
         return await accountRemoteDataSource.updatePassword(currentPassword, password, rePassword ,token);
       },
       connectivity: connectivity);
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> updateUserProfile(
      String name,
      String email,
      String token,
      ) async {
    return await handleRepoNetworkRequest<AuthResponseEntity>(
      connectivity: connectivity,
      onlineRequest: () async {
        final response = await accountRemoteDataSource.updateUserProfile(name, email, token);

        if (response.isRight()) {
          final user = response.getOrElse(() => throw Exception());

          final prefs = await SharedPreferences.getInstance();
          final oldEmail = prefs.getString("email");
          final authLocal = getIt<AuthLocalDataSource>();

          if (oldEmail != null) {
            final box = await CacheHelper().openBoxIfNeeded(ApiConstant.authBox);
            await box.delete(oldEmail);

            await authLocal.saveUserInfo(user.user?.email ?? oldEmail, user);

            if (user.user?.email != oldEmail) {
              await prefs.setString("email", user.user?.email ?? oldEmail);
            }

          }
        }

        return response;
      },
    );
  }


}