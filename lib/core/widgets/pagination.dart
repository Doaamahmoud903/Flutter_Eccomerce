import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import '../theming/color_manager.dart';

class Pagination extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final Function(int) onPageChanged;

  const Pagination({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: NumberPagination(
        totalPages: totalPages,
        currentPage: currentPage,
        onPageChanged: onPageChanged,

        visiblePagesCount: 5,
        fontSize: 14,
        fontFamily: 'Poppins',

        buttonElevation: 3,
        buttonRadius: 12,
        numberButtonSize: const Size(42, 42),
        controlButtonSize: const Size(40, 40),

        selectedButtonColor: ColorManager.primaryColor,
        unSelectedButtonColor: ColorManager.discountTextColor,
        controlButtonColor: ColorManager.primaryColor,

        firstPageIcon: const Icon(Icons.keyboard_double_arrow_left, color: Colors.black, size: 18),
        previousPageIcon: const Icon(Icons.chevron_left, color: Colors.black),
        nextPageIcon: const Icon(Icons.chevron_right, color: Colors.black),
        lastPageIcon: const Icon(Icons.keyboard_double_arrow_right, color: Colors.black, size: 18),

        navigationButtonSpacing: 4.0,
        sectionSpacing: 4.0,
        betweenNumberButtonSpacing: 2.0,
      ),
    );
  }
}
