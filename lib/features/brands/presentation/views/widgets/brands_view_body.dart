import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/widgets/pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_loding_indicator.dart';
import '../../manager/brands_states.dart';
import '../../manager/brands_view_model.dart';

class BrandsViewBody extends StatelessWidget {
  final BrandsViewModel brandsViewModel = getIt<BrandsViewModel>();

  BrandsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.arrow_back ,color:ColorManager.primaryColor,size: 30,),

        ),
        title: Text("Brands",
        style: Theme.of(context).textTheme.headlineMedium,

        ),
        centerTitle: true,
      ),
      body: BlocBuilder<BrandsViewModel, BrandsStates>(
        bloc: brandsViewModel..getAllBrands(),
        buildWhen: (previous, current) {
          return current is BrandsSuccess || current is BrandsFailure;
        },
        builder: (context, state) {
          if (state is BrandsLoading) {
            return const Center(child: CustomLoadingIndicator());
          } else if (state is BrandsFailure) {
            return const Center(child: Text("Error loading brands"));
          } else if (state is BrandsSuccess) {
            final brands = brandsViewModel.brandsList;
            final totalPages = state.cetegoryBrandResponseEntity?.metadata?.numberOfPages?.toInt() ?? 0;
            final currentPage = state.cetegoryBrandResponseEntity?.metadata?.currentPage?.toInt() ?? 1;
      
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                brands[index].image ?? "",
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              brands[index].name ?? "",
                              style: const TextStyle(fontSize: 12 , color: ColorManager.primaryDark),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Pagination(
                  totalPages: totalPages,
                  currentPage: currentPage,
                  onPageChanged: (newPage) {
                    brandsViewModel.getAllBrands(page: newPage);
                  },
                ),
              ],
            );
          }
      
          return Container();
        },
      ),
    );
  }
}
