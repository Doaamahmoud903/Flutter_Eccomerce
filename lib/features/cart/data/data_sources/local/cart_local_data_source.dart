import '../../../domain/entities/get_cart_response_entity.dart';
import '../../models/get_cart_response_dm.dart';

abstract class CartLocalDataSource{
  Future<GetCartProductsResponseDm?> getCartInfo( String token,);
  Future<void> saveCartInfo(String token ,GetCartProductsResponseDm userInfo);
  Future<void> clearCartInfo(String token);

}