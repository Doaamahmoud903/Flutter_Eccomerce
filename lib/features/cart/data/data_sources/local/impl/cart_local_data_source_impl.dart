import 'package:eccomerce_app/features/cart/domain/entities/cart_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_constant.dart';
import '../../../../../../core/cach_helper/cach_helper.dart';
import '../../../../domain/entities/get_cart_response_entity.dart';
import '../../../models/get_cart_response_dm.dart';
import '../cart_local_data_source.dart';

@Injectable(as: CartLocalDataSource)
class CartLocalDataSourceImpl extends CartLocalDataSource{
  //static const cartKeyPrefix = "cart_";

  @override
  Future<void> saveCartInfo(String token, GetCartProductsResponseDm cart) async {
    final box = await CacheHelper().openBoxIfNeeded(ApiConstant.cartBox);
    box.put(token, cart);

  }

  @override
  Future<GetCartProductsResponseDm?> getCartInfo(String token) async {
    final box = await CacheHelper().openBoxIfNeeded(ApiConstant.cartBox);
    return box.get(token);
  }


  @override
  Future<void> clearCartInfo(String token) async {
    final box = await CacheHelper().openBoxIfNeeded(ApiConstant.cartBox);
    await box.delete(token);
  }
}