import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eccomerce_app/core/widgets/custom_loding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/theming/color_manager.dart';

class ProductSlider extends StatefulWidget {
  final List<String> items;
  final int initialIndex;
  const ProductSlider(
      {super.key, required this.initialIndex, required this.items});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ImageSlideshow(
          onPageChanged: (value) {
            currentIndex = value;
            setState(() {});
          },
          indicatorColor: Colors.transparent,
          initialPage: currentIndex,
          indicatorBackgroundColor: Colors.transparent,
          isLoop: true,
          autoPlayInterval: 3000,
          height: 300.h,
          children: widget.items.map((url) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border:
                  Border.all(color: ColorManager.primary30Opacity, width: 1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 120.h,
                  fit: BoxFit.cover,
                  imageUrl: url,
                  placeholder: (context, url) => const Center(
                    child: CustomLoadingIndicator(
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: ColorManager.redColor,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Positioned(
            top: 8.h,
            right: 8.w,
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Shadow color
                    spreadRadius: 1,
                    blurRadius: 14,
                    offset: const Offset(0, 7), // Shadow position
                  ),
                ],
              ),
              child: IconButton(
                  onPressed: () {
                    // todo add to favorite
                  },
                  color: ColorManager.primaryColor,
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.favorite_border_rounded,
                  )),
            )),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.items.length,
            duration: const Duration(microseconds: 0),
            effect: ExpandingDotsEffect(
              dotWidth: 7.w,
              dotHeight: 7.h,
              dotColor: Colors.grey.shade400,
              paintStyle: PaintingStyle.fill,
              activeDotColor: ColorManager.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
