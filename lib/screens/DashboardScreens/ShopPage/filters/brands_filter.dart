import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/filter_components_providers.dart';
import 'package:zenify/utils/globalvariable.dart';

class BrandsFiltersPage extends StatefulWidget {
  const BrandsFiltersPage({super.key});

  @override
  State<BrandsFiltersPage> createState() => _BrandsFiltersPageState();
}

class _BrandsFiltersPageState extends State<BrandsFiltersPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final brandProvider = Provider.of<FilterProvider>(context);

    return Scaffold(
      bottomSheet: Material(
        elevation: 1,
        shadowColor: Colors.grey,
        child: Container(
            height: 104.h,
            width: 375.w,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //discard button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 130.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          border: Border.all(color: Colors.black, width: 1),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          'Discard',
                          style: headerStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                //apply button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    //make a method to filter items
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 130.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: primaryRed),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: headerStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          'Brands',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Container(
                height: 40.h,
                width: 343.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: searchController,
                  // backgroundColor:
                  //     MaterialStateProperty.all<Color>(Colors.white),
                  // shadowColor: MaterialStateProperty.all<Color>(Colors.white),
                  // controller: searchController,
                  onTapOutside: (event) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Search',
                    prefix: const Icon(
                      Icons.search,
                    ),
                    hintStyle:
                        headerStyle.copyWith(fontSize: 16, color: Colors.grey),
                  ),

                  // ),
                ),
              ),
            ),
            //List of brands avalible
            Expanded(
              child: ListView.builder(
                  itemCount: clothingBrands.length,
                  itemBuilder: (context, index) {
                    bool selectedbrand =
                        brandProvider.selectedBrands.contains(index);
                    return GestureDetector(
                      onTap: () {
                        if (brandProvider.selectedBrands.contains(index)) {
                          brandProvider.removeBrand(index);
                        } else if (!brandProvider.selectedBrands
                            .contains(index)) {
                          brandProvider.addBrand(index);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              clothingBrands[index],
                              style: headerStyle.copyWith(
                                  fontSize: 16,
                                  color:
                                      selectedbrand ? primaryRed : Colors.grey),
                            ),
                            Container(
                              child: selectedbrand
                                  ? Icon(
                                      Icons.check_box_rounded,
                                      color: primaryRed,
                                    )
                                  : Icon(
                                      Icons.check_box_outline_blank,
                                      color: Colors.grey,
                                    ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
