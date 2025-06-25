import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_constant.dart';
import '../../../../../../core/api/api_services.dart';
import '../../../../../../core/connectivity/handle_network_request.dart';
import '../../../../../../core/errors/models/api_error_model.dart';
import '../../../models/auth_response_dto.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;
  final Connectivity connectivity;
  AuthRemoteDataSourceImpl(this.apiService , {required this.connectivity});
  @override
  Future<Either<Failure, AuthResponseDto>> forgotPassword(String email) async{
    try{
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||connectivityResult.contains(ConnectivityResult.wifi)) {
        final response = await apiService.post(
          endPoint: ApiConstant.forgotPassword,
          data: {"email": email},
        );
        print("Response: $response");
        final authResponse = AuthResponseDto.fromJson(response);
        return right(authResponse);
      } else{
          // NO Internet Connection
        return left(NetworkFailure("No Internet Connection"));
      }
    }catch (error) {
      if (error is DioException) {
        return Left(
            ServerFailure.fromResponse(
                error.response?.statusCode,
                ApiErrorResponse.fromJson(error.response?.data)
            )
        );
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, AuthResponseDto>> login(String email, String password) async{
    try{
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.post(
          endPoint: ApiConstant.login,
          data: {
            "email": email,
            "password": password
          },
        ),
      );

      print("Response: $result");

      final authResponse = AuthResponseDto.fromJson(result);
      return right(authResponse);
    }catch (error) {
      if (error is DioException) {
        return left(
            ServerFailure.fromResponse(
                error.response?.statusCode,
                ApiErrorResponse.fromJson(error.response?.data)
            )
        );
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, AuthResponseDto>> register(String name, String email, String password, String rePassword, String phone) async{
    try{
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||connectivityResult.contains(ConnectivityResult.wifi)) {
        final response = await apiService.post(
          endPoint: ApiConstant.signup,
          data: {
            "name": name,
            "email": email,
            "password" : password,
            "rePassword" : rePassword,
            "phone":phone
          },
        );
        print("Response: $response");
        final authResponse = AuthResponseDto.fromJson(response);
        return right(authResponse);
      } else{
        // NO Internet Connection
        return left(NetworkFailure("No Internet Connection"));
      }
    }catch (error) {
      if (error is DioException) {
        final errorMsg = error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMsg));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }


  @override
  Future<Either<Failure, AuthResponseDto>> resetCode(String resetCode) async {
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.post(
          endPoint: ApiConstant.resetCode,
          data: {
            "resetCode": resetCode,
          },
        ),
      );

      print("Response: $result");

      final authResponse = AuthResponseDto.fromJson(result);
      return right(authResponse);

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
  Future<Either<Failure, AuthResponseDto>> resetPassword(String email , String newPassword) async {
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.put(
          endPoint: ApiConstant.resetPassword,
          data: {
            "email": email,
            "newPassword": newPassword,
          },
        ),
      );

      print("Response: $result");

      final authResponse = AuthResponseDto.fromJson(result);
      return right(authResponse);

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
