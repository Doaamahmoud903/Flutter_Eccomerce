import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';

abstract class AuthLocalDataSource {
  Future<AuthResponseEntity?> getUserInfo( String email,
      String password,);
  Future<void> saveUserInfo(String email ,AuthResponseEntity userInfo);


}
