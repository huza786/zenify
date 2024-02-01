import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/FavoriteScreens/provider/favorite_provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/filter_components_providers.dart';
import 'package:zenify/utils/globalvariable.dart';

class CustomBottomSheet extends StatelessWidget {
  final Product productModel;
  const CustomBottomSheet({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    //FavoriteListState
    final productCardState = Provider.of<ProductCardState>(context);
    final favoriteState = Provider.of<FavoriteListState>(context);

    String selectedFavoriteSize = ' ';
    String selectedFavoriteColor = ' ';
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(34), topRight: Radius.circular(34)),
      child: Container(
        height: 100 + 373.h,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select Size',
                  style: headerStyle.copyWith(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              //TODO:adding colors strings to product model
              //Sizes Selection
              Wrap(
                //tried to implement both of it
                //https://stackoverflow.com/questions/67514733/flutter-get-index-value-from-map
                //https://stackoverflow.com/questions/76001959/want-only-one-active-button-from-four-buttons-flutter
                children: List.generate(
                    Sizes.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 11.w, vertical: 8.h),
                          child: GestureDetector(
                            onTap: () {
                              selectedFavoriteSize = Sizes[index];
                              productCardState.selectSizeToggleItem(index);
                              //TODO:save selected size in favorite list
                            },
                            child: Container(
                              height: 40.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: productCardState.toggleSizeSelected ==
                                          index
                                      ? primaryRed
                                      : Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(Sizes[index],
                                    style: headerStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: productCardState
                                                    .toggleSizeSelected ==
                                                index
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            ),
                          ),
                        ))
                // colorsList.asMap().entries.map(
                //   (e) {

                //   },
                // ).toList(),
                ,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select Color',
                  style: headerStyle.copyWith(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Wrap(
                //tried to implement both of it
                //https://stackoverflow.com/questions/67514733/flutter-get-index-value-from-map
                //https://stackoverflow.com/questions/76001959/want-only-one-active-button-from-four-buttons-flutter
                children: List.generate(
                    colorsList.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 11.w, vertical: 8.h),
                          child: GestureDetector(
                            onTap: () {
                              // selectedFavoriteSize =
                              //     colorsList[index];
                              productCardState.selectColorToggleItem(index);
                              selectedFavoriteColor = colorsList[index];

                              //TODO:save selected size in favorite list
                            },
                            child: Container(
                              height: 40.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: productCardState.toggleColorSelected ==
                                          index
                                      ? primaryRed
                                      : Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(colorsList[index],
                                    style: headerStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: productCardState
                                                    .toggleColorSelected ==
                                                index
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            ),
                          ),
                        ))
                // colorsList.asMap().entries.map(
                //   (e) {

                //   },
                // ).toList(),
                ,
              ),
              const Divider(),
              //Adding a size info widgit
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Size Info',
                      style: headerStyle,
                    ),
                    IconButton(
                      onPressed: () {
                        //TODO:add size info
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  favoriteState.addToFavoriteList(productModel,
                      selectedFavoriteColor, selectedFavoriteSize);
                  //TODO add ADDTO cart logic
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(36),
                    shadowColor: Colors.grey,
                    elevation: 4,
                    child: Container(
                      width: double.infinity,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          36,
                        ),
                        color: primaryRed,
                      ),
                      child: Center(
                        child: Text(
                          'Add To Favorites',
                          style: headerStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
