import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_states.dart';

class BottomNavigateBar extends StatelessWidget {
   const BottomNavigateBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        final cubit = LayoutCubit.get(context);

        return Theme(
          data: Theme.of(context).copyWith(canvasColor: ColorManager.primaryColor),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            iconSize: 24.sp,
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottom(index),
            items: [
              _bottomNavBarItemBuilder(
                isSelected: cubit.currentIndex == 0,
                selectedIcon: AssetManager.selectedHomeIcon,
                unselectedIcon: AssetManager.unSelectedHomeIcon,
              ),
              _bottomNavBarItemBuilder(
                isSelected: cubit.currentIndex == 1,
                selectedIcon: AssetManager.selectedCategoryIcon,
                unselectedIcon: AssetManager.unSelectedCategoryIcon,
              ),
              _bottomNavBarItemBuilder(
                isSelected: cubit.currentIndex == 2,
                selectedIcon: AssetManager.selectedFavouriteIcon,
                unselectedIcon: AssetManager.unSelectedFavouriteIcon,
              ),
              _bottomNavBarItemBuilder(
                isSelected: cubit.currentIndex == 3,
                selectedIcon: AssetManager.selectedAccountIcon,
                unselectedIcon: AssetManager.unSelectedAccountIcon,
              ),
            ],
          ),
        );
      },
    );
  }


  BottomNavigationBarItem _bottomNavBarItemBuilder(
      {required bool isSelected,
        required String selectedIcon,
        required String unselectedIcon}) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor:
        isSelected ? ColorManager.primaryColor : ColorManager.whiteColor,
        backgroundColor: isSelected ? ColorManager.whiteColor : Colors.transparent,
        radius: 25.r,
        child: Image.asset(
          isSelected ? selectedIcon : unselectedIcon,
        ),
      ),
      label: "",
    );
  }
}
