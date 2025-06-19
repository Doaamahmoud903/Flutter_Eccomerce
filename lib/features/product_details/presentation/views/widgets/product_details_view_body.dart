import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/features/products/presentation/views/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../products/domain/entities/products_response_entity.dart';


class ProductDetailsViewBody extends StatefulWidget {
  final Product product;
  const ProductDetailsViewBody({super.key, required this.product});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  int productCounter = 0;
  int selectedColor = 0;
  int selectedSize = 0;
  double totalPrice = 0;

  List<int> sizes = [35, 38, 39, 40];
  List<Color> color = [
    Colors.red,
    Colors.blueAccent,
    Colors.green,
    Colors.yellow,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.title ?? "",
          style: Styles.semi20Primary,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: ColorManager.primaryColor,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primaryColor,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSlider(
                initialIndex: 0,
                items: widget.product.images ?? [],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.category?.name ?? "",
                      style: Styles.medium18Header,
                    ),
                  ),
                  Text(
                    "EGP ${widget.product.price.toString()}" ?? "",
                    style: Styles.medium18Header,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorManager.primaryColor.withOpacity(.3),
                          width: 1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Text(
                      '${widget.product.sold} Sold',
                      overflow: TextOverflow.ellipsis,
                      style: Styles.medium14PrimaryDark,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorManager.yellowColor,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),

                    Expanded(
                      child: Text(
                        "${widget.product.ratingsAverage ?? ""} (${widget.product.quantity ?? ""})",
                        overflow: TextOverflow.ellipsis,
                        style: Styles.regular14Text,
                      ),
                    ),

                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              if (productCounter != 0) {
                                productCounter--;
                                //todo: get unit price first
                                // assuming unit price is 500
                                totalPrice -= 500;
                                setState(() {});
                              }
                            },
                            child: Icon(
                              Icons.remove_circle_outline,
                              size: 20.w,
                              color: ColorManager.whiteColor,
                            )),
                        SizedBox(
                          width: 18.w,
                        ),
                        AutoSizeText(
                          '$productCounter',
                          style: Styles.medium18White,
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        InkWell(
                            onTap: () {
                              productCounter++;
                              //todo: get unit price first
                              // assuming unit price is 500
                              totalPrice += 500;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.add_circle_outline,
                              color: ColorManager.whiteColor,
                              size: 20.w,
                            )),
                      ],
                    ),
                  )

                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Description',
                style: Styles.medium18Header,
              ),
              SizedBox(
                height: 8.h,
              ),
              ReadMoreText(
                widget.product.description ?? "",
                style: Styles.medium14LightPrimary,
                trimExpandedText: ' Read Less',
                trimCollapsedText: ' Read More',
                trimLines: 3,
                trimMode: TrimMode.Line,
                colorClickableText: ColorManager.primaryColor,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text('Size', style: Styles.medium18Header),
              _buildSizeSection(),
              Text('Color', style: Styles.medium18Header),
              _buildColorSection(),
              _buildPriceSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorSection() {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      height: 45.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSize = index;
                });
              },
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: color[index],
                child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      color: index == selectedSize
                          ? ColorManager.whiteColor
                          : Colors.transparent,
                    )),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 17.w,
          ),
          itemCount: color.length),
    );
  }

  Widget _buildSizeSection() {
    return Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 24.h),
      height: 45.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = index;
                });
              },
              child: CircleAvatar(
                radius: 22.r,
                backgroundColor: index == selectedColor
                    ? ColorManager.primaryColor
                    : Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
                  child: Text(
                    '${sizes[index]}',
                    style: Styles.regular14Text.copyWith(
                        color: index == selectedColor
                            ? ColorManager.whiteColor
                            : ColorManager.primaryColor),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 17.w,
          ),
          itemCount: sizes.length),
    );
  }

  Widget _buildPriceSection() {
    return Container(
      margin: EdgeInsets.only(top: 48.h),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Total price',
                style: Styles.medium18Header
                    .copyWith(color: ColorManager.primaryDark.withOpacity(0.6)),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text("EGP ${widget.product.price}", style: Styles.medium18Header)
            ],
          ),
          SizedBox(
            width: 33.w,
          ),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.r)),
                  backgroundColor: ColorManager.primaryColor,
                  padding:
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_shopping_cart,
                      color: ColorManager.whiteColor,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    AutoSizeText("Add To Cart", style: Styles.medium20White),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
