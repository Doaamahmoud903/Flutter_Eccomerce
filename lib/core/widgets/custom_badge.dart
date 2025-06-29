import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/features/cart/presentation/manager/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/cart/presentation/manager/cart_states.dart';
import '../routes/app_routes.dart';
import '../utils/assets_manager.dart';

class CustomAppBarBadge extends StatelessWidget {
  final int count;

  const CustomAppBarBadge({required this.count, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return InkWell(
      onTap: currentRoute != AppRoutes.cartRoute
          ? () {
        Navigator.of(context).pushNamed(AppRoutes.cartRoute);
      }
          : null,
      child: BlocBuilder<CartViewModel, CartStates>(
        builder: (context, state) {
          int itemCount = count;

          if (state is GetCartSuccesState) {
            itemCount = state.cart.numOfCartItems?.toInt() ?? 0;
          }

          return Badge(
            alignment: AlignmentDirectional.topStart,
            backgroundColor: ColorManager.greenColor,
            label: Text(itemCount.toString()),
            child: ImageIcon(
              const AssetImage(AssetManager.shoppingCart),
              size: 35.sp,
              color: ColorManager.primaryColor,
            ),
          );
        },
      ),
    );
  }
}
