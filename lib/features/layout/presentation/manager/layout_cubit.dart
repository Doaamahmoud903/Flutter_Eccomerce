import 'package:eccomerce_app/features/categories/presentation/views/categories_view.dart';
import 'package:eccomerce_app/features/wishlist/presentation/views/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eccomerce_app/features/account/presentation/views/account_view.dart';
import '../../../home/presentation/views/home_view.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  final List<Widget> bottomScreens = [
     const HomeView(),
     const CategoriesView(),
     const WishlistView(),
     const AccountView(),
  ];

  int currentIndex = 0;
  void changeBottom(int index) {
    currentIndex = index;
    emit((LayoutChangeBottomNavState()));
  }

  void goToCategoriesView() {
    currentIndex = 1;
    emit(LayoutChangeBottomNavState());
  }
}
