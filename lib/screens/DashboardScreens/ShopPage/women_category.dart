// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/bottom_sheet.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/custom_app_bar.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/product_card_list_view.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/tag_widget.dart';
import 'package:zenify/utils/app_routes.dart';
import 'package:zenify/utils/globalvariable.dart';

class WomenCategories extends StatefulWidget {
  const WomenCategories({super.key});

  @override
  State<WomenCategories> createState() => _WomenCategoriesState();
}

class _WomenCategoriesState extends State<WomenCategories> {
  double targetValue = 100.h;
  bool listOrNot = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        duration: const Duration(milliseconds: 500),
        height: targetValue,
        child: Stack(
          children: [
            Positioned(
              top: 54.h,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            Positioned(
                left: 340.w,
                top: 54.h,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search))),
            AnimatedPositioned(
              left: listOrNot ? 12.w : MediaQuery.of(context).size.width * .3,
              duration: const Duration(milliseconds: 600),
              top: listOrNot ? 106.h : 70.h,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 600),
                style: listOrNot
                    ? headerStyle.copyWith(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                      )
                    : headerStyle.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                child: const Text(
                  "Women's tops",
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Material(
            elevation: 4,
            shadowColor: Colors.grey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h, // Adjust the height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return TagWidget(
                          tagTitle: 'Title',
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Filter button

                      TextButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          //TODO:Add filter page and filter the items
                          Navigator.pushNamed(context, AppRoutes.filersPage);
                        },
                        child: SizedBox(
                          width: 63.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.filter_list,
                                color: Colors.black,
                              ),
                              Text(
                                'Filters',
                                style: headerStyle.copyWith(
                                    fontSize: 11, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      //SortBy
                      Builder(
                        builder: (context) => TextButton(
                          style: const ButtonStyle(),
                          onPressed: () {
                            //TODO:Add Sortby
                            Scaffold.of(context)
                                .showBottomSheet<void>((BuildContext context) {
                              return const BottomSheetView();
                            });
                          },
                          child: SizedBox(
                            width: 137.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.swap_vert,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Price: lowest to high',
                                  style: headerStyle.copyWith(
                                      fontSize: 11, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await Future.delayed(const Duration(
                              milliseconds: 500)); // Simulating a delay

                          setState(() {
                            targetValue = targetValue == 100.h ? 140.h : 100.h;
                            listOrNot = !listOrNot;
                            isLoading = false;
                          });
                        },
                        icon: !listOrNot
                            ? const Icon(
                                Icons.list,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.grid_view_outlined,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Stack(children: [
              Positioned.fill(
                child: isLoading
                    ? const Center(
                        child: const CircularProgressIndicator(),
                      )
                    : const SizedBox.shrink(),
              ),
              listOrNot
                  ?
                  //Gridview of products
                  GridView.builder(
                      padding: EdgeInsets.all(8.w),
                      itemCount: productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .6,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0, // Set spacing between columns
                        mainAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        // Access each product map in the list
                        Product currentProduct = productList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: ProductCard(
                            product: currentProduct,
                          ),
                        );
                      },
                    )
                  //ListView of products
                  : GridView.builder(
                      padding: EdgeInsets.all(8.w),
                      itemCount: productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3.1,
                        crossAxisCount: 1,
                        crossAxisSpacing: 8.0, // Set spacing between columns
                        mainAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        // Access each product map in the list
                        Product currentProduct = productList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: ProductCardListView(
                            product: currentProduct,
                          ),
                        );
                      },
                    ),
            ]),
          )
        ],
      ),
    );
  }
}



//// bottom: PreferredSize(
      //   preferredSize: Size(double.infinity, targetValue),
      //   child: AnimatedContainer(
      //     duration:
      //         Duration(milliseconds: 500), // Adjust the duration as needed
      //     height: targetValue,
      //     child: Stack(
      //       children: [
      //         AnimatedOpacity(
      //           curve: Curves.easeIn,
      //           opacity: _visible ? 1.0 : 0.0,
      //           duration: const Duration(milliseconds: 1000),
      //           child: Text("Women's Tops"),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
//   appBar: AppBar(
    //     actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    //     forceMaterialTransparency: true,
    //     leading: IconButton(
    //       onPressed: () => Navigator.pop(context),
    //       icon: const Icon(Icons.arrow_back_ios_new),
    //     ),
    //     iconTheme: const IconThemeData(color: Colors.black),
    //     elevation: 0,
    //     backgroundColor: Colors.transparent,
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: EdgeInsets.fromLTRB(12.w, 0, 0, 0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             "Women's tops",
    //             style: headerStyle.copyWith(
    //               fontSize: 34,
    //               fontWeight: FontWeight.w800,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 60.h, // Adjust the height as needed
    //             child: ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: 6,
    //               itemBuilder: (context, index) {
    //                 return TagWidget(
    //                   tagTitle: 'Title',
    //                 );
    //               },
    //             ),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               //Filter button

    //               TextButton(
    //                   style: ButtonStyle(),
    //                   onPressed: () {
    //                     //TODO:Add filter page and filter the items
    //                   },
    //                   child: SizedBox(
    //                     width: 63.w,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Icon(
    //                           Icons.format_align_justify_rounded,
    //                           color: Colors.black,
    //                         ),
    //                         Text(
    //                           'Filters',
    //                           style: headerStyle.copyWith(
    //                               fontSize: 11, color: Colors.black),
    //                         )
    //                       ],
    //                     ),
    //                   )),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),