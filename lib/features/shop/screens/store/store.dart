import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/appbar/appbar.dart';
import 'package:fruitmarket/common/widgets/appbar/tabbar.dart';
import 'package:fruitmarket/common/widgets/brands/brand_card.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:fruitmarket/common/widgets/layouts/grid_layout.dart';
import 'package:fruitmarket/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:fruitmarket/common/widgets/texts/section_heading.dart';
import 'package:fruitmarket/features/shop/controllers/category_controller.dart';
import 'package:fruitmarket/features/shop/screens/store/widgets/category_tab.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/constants/sizes.dart';
import 'package:fruitmarket/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late FocusNode _searchFocusNode;
  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return DefaultTabController(
      length: categoryController.allCategories.length,
      child: Builder(builder: (context) {
        final tabController = DefaultTabController.of(context);

        // Set up a listener for tab changes to fetch products
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            final selectedCategory =
                categoryController.allCategories[tabController.index];
            categoryController.fetchCategoryProducts(selectedCategory.name);
          }
        });

        return Scaffold(
          appBar: TAppBar(
            title: Text("Store",
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              TCartCounterIcon(
                  counterBgColor: TColors.black,
                  iconColor: TColors.black,
                  onPressed: () {}),
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunction.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 420,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),
                        TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          focusNode: _searchFocusNode, // Attach FocusNode
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        const TSectionHeading(
                          showActionButton: false,
                          title: "Featured Categories",
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                        TGridLayout(
                          itemCount: categoryController.allCategories.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final category =
                                categoryController.allCategories[index];
                            return TBrandCard(
                              name: category.name,
                              showBorder: false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  bottom: TTabBar(
                    tabs: categoryController.allCategories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList(),
                  ),
                ),
              ];
            },
            body: Obx(() {
              if (categoryController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return TabBarView(
                children: categoryController.allCategories
                    .map((category) => TCategoryTab(
                          products: categoryController.categoryProducts,
                        ))
                    .toList(),
              );
            }),
          ),
        );
      }),
    );
  }
}
