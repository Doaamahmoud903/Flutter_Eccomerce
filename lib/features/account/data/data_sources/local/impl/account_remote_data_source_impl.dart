import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_constant.dart';
import '../../../../../../core/api/api_services.dart';
import '../../../../../../core/connectivity/handle_network_request.dart';
import '../../../../../auth/data/models/auth_response_dto.dart';
import '../account_remote_data_source.dart';


@Injectable(as: AccountRemoteDataSource)
class AccountRemoteDataSourceImpl extends AccountRemoteDataSource{
  final ApiService apiService;
  final Connectivity connectivity;

  AccountRemoteDataSourceImpl(this.apiService, {required this.connectivity});
  @override
  Future<Either<Failure, AuthResponseDto>> updatePassword(String currentPassword, String password, String rePassword ,String token) async{
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.put(
          endPoint: ApiConstant.updatePassword,
          token: token,
          data: {
            "currentPassword" :currentPassword,
            "password": password,
            "rePassword": rePassword,
          },
        ),
      );

      print("Response: $result");
      final updateResponse = AuthResponseDto.fromJson(result);
      return right(updateResponse);

    } catch (error) {
      if (error is DioException) {
        final errorMsg = error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMsg));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, AuthResponseDto>> updateUserProfile(String name, String email ,String token) async{
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.put(
          endPoint: ApiConstant.updateUserData,
          token: token,
          data: {
            "name" :name,
            "email": email,
          },
        ),
      );

      print("Response: $result");
      final updateResponse = AuthResponseDto.fromJson(result);
      return right(updateResponse);

    } catch (error) {
      if (error is DioException) {
        final errorMsg = error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMsg));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

}