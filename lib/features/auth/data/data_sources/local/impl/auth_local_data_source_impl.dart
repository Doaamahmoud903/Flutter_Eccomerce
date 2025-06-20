import 'package:eccomerce_app/core/api/api_constant.dart';
import 'package:eccomerce_app/core/cach_helper/cach_helper.dart';
import 'package:eccomerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:AuthLocalDataSource )
class AuthLocalDataSourceImpl extends AuthLocalDataSource{
  @override
  Future<AuthResponseEntity?> getUserInfo( String email, String password,) async{
    final box = await CacheHelper().openBoxIfNeeded(ApiConstant.authBox);
    final userInfo = box.get(email);
   return userInfo;

  }

  @override
  Future<void> saveUserInfo(String email, AuthResponseEntity userInfo) async{
    final box = await CacheHelper().openBoxIfNeeded(ApiConstant.authBox);
    await box.put(email, userInfo);
    await box.close();
  }
}