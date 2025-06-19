import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/color_manager.dart';
import '../../../domain/entities/category_brand_response_entity.dart';

class CategoryBrandItem extends StatelessWidget {
  final Data items;
  const CategoryBrandItem({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CachedNetworkImage(
              width: double.infinity,
              height: 10.h,
              fit: BoxFit.cover,
              imageUrl:
              items.image ?? "",
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 50.r,
                );
              },
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryDark,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: ColorManager.redColor,
              ),
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 4,
            child: Text(
              items.name ?? "",
              textWidthBasis: TextWidthBasis.longestLine,
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ColorManager.primaryDark,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            ))
      ],
    );
  }
}
