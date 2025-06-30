
import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/core/routes/app_routes.dart';
import 'package:eccomerce_app/core/widgets/custom_loding_indicator.dart';
import 'package:eccomerce_app/features/layout/presentation/manager/layout_cubit.dart';
import 'package:eccomerce_app/features/orders/presentation/manager/order_states.dart';
import 'package:eccomerce_app/features/orders/presentation/manager/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/theming/styles_manager.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../wishlist/presentation/views/widgets/custom_elevated_button.dart';

class OrderViewBody extends StatelessWidget {
  String? cartId;
  OrderViewBody(this.cartId);

  @override
  Widget build(BuildContext context) {
    final orderViewModel = OrderViewModel.get(context);
    final layoutCubit = LayoutCubit.get(context);

    print("$cartId >>>>>>>>>>>>>>>>>>>>>>>>>>>.");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: ColorManager.primaryDark,
          ),
        ),

        title: const Text("Checkout", style: TextStyle(
          fontSize: 22,
          color: ColorManager.primaryDark
        ),),
        centerTitle: true,
      ),
      body: BlocBuilder<OrderViewModel , OrderStates>(
          builder: (context, state){
            if(state is CreateOrderFailureState){
              print(state.failure.errMessage);
              return  Center(child: Text(state.failure.errMessage, style: TextStyle(
                color: ColorManager.primaryDark
              ),),);
            }else if(state is OrderLoadingState){
              return const Center(child: CustomLoadingIndicator(),);
            }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Form(
             // key: accountViewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h,),
                  AutoSizeText(
            "Details",
            style: Styles.medium18Header,
                  ),
                  CustomTextFormField(
            isPassword: false,
            keyboardType: TextInputType.name,
            controller: orderViewModel.detailsController,
            borderColor: ColorManager.primary30Opacity,
            textStyle: Styles.medium14PrimaryDark,
                  ),
                  AutoSizeText(
            "Phone",
            style: Styles.medium18Header,
                  ),
                  CustomTextFormField(
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
            controller: orderViewModel.phoneController,
            borderColor: ColorManager.primary30Opacity,
            textStyle: Styles.medium14PrimaryDark,
                  ),
                  AutoSizeText(
            "City",
            style: Styles.medium18Header,
                  ),
                  CustomTextFormField(
            isPassword: false,
            controller: orderViewModel.cityController,
            borderColor: ColorManager.primary30Opacity,
            textStyle: Styles.medium14PrimaryDark,
                  ),
                  SizedBox(height: 20.h,),

                  CustomElevatedButton(
               text: state is OrderLoadingState
                  ? "Loading ..."
                  : "Check out",
             onPressed: (){
               orderViewModel.createCashOrder(cartId!);
             },
              backgroundColor: ColorManager.greenColor,
              textStyle: Styles.medium18White,
            // text: "Check out",

                  )

            ], ),
                  ),
          ),
            );
          },
      ));
  }
}