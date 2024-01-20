import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/filter_components_providers.dart';
import 'package:zenify/utils/app_routes.dart';
import 'package:zenify/utils/globalvariable.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  bool _isColorSelected = false;
  bool _isSizeSelected = false;
  bool _CategorySelected = false;

  @override
  Widget build(BuildContext context) {
    final filterProv = Provider.of<FilterProvider>(context);
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
          'Filters',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Price Range',
                  style: headerStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              //Price Range Slider
              Container(
                height: 88.h,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    Positioned(
                        left: 16.w,
                        top: 20.h,
                        child: Text(
                          """${_currentRangeValues.start.toInt()}\$""",
                          style: headerStyle.copyWith(
                              color: Colors.black, fontSize: 14),
                        )),
                    Positioned(
                      height: 40.h,
                      width: 343.w,
                      top: 24.h,
                      left: 16.w,
                      child: RangeSlider(
                        activeColor: primaryRed,
                        values: _currentRangeValues,
                        max: 500,
                        divisions: 50,
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      left: 311.w,
                      top: 20.h,
                      child: Text(
                        """${_currentRangeValues.end.toInt()}\$""",
                        style: headerStyle.copyWith(
                            color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Colors',
                  style: headerStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              //Color Picker
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: 92.h,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _isColorSelected = !_isColorSelected;
                        //TODO:add selected color model interactibity
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                            // color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: _isColorSelected
                                    ? primaryRed
                                    : Colors.transparent,
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignOutside)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                color: primaryRed, shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Size Selector
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Size',
                  style: headerStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSizeSelected = !_isSizeSelected;
                  });
                },
                child: Container(
                  height: 88.h,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.w),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: _isSizeSelected
                                        ? primaryRed
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.grey)),
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: Text('S',
                                      style: headerStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: _isSizeSelected
                                              ? Colors.white
                                              : Colors.black)),
                                ),
                              ),
                            )),
                  ),
                ),
              ),
              // Category selector
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Category',
                  style: headerStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 100.h,
                color: Colors.white,
                child: Wrap(
                    children: categoryList2.map((e) {
                  var isSelected = filterProv.selectedCategory.contains(e);
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.w, vertical: 6.h),
                      child: GestureDetector(
                        onTap: () {
                          if (isSelected) {
                            filterProv.removeCategory(e);
                          } else {
                            filterProv.addCategory(e);
                          }
                        },
                        child: Container(
                          width: 100.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                              color:
                                  isSelected ? primaryRed : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: isSelected
                                      ? Colors.transparent
                                      : Colors.grey,
                                  width: 2)),
                          child: Center(
                            child: Text(
                              e.toString(),
                              style: headerStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      isSelected ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                      ));
                }).toList()
                    // List.generate(
                    //   5,
                    //   (index) => Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 6.h),
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           _CategorySelected = !_CategorySelected;
                    //         });
                    //       },
                    //       child: Container(
                    //         width: 100.w,
                    //         height: 40.w,
                    //         decoration: BoxDecoration(
                    //             color:
                    //                 _CategorySelected ? primaryRed : Colors.transparent,
                    //             borderRadius: BorderRadius.circular(8),
                    //             border: Border.all(
                    //                 color: _CategorySelected
                    //                     ? Colors.transparent
                    //                     : Colors.grey,
                    //                 width: 2)),
                    //         child: Center(
                    //           child: Text(
                    //             'Men',
                    //             style: headerStyle.copyWith(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: _CategorySelected
                    //                     ? Colors.white
                    //                     : Colors.black),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    ),
              ),
              //Brands List navigator
              ListTile(
                // tileColor: Colors.white,
                title: Text(
                  'Brands',
                  style: headerStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'adidas Originals, Jack & Jones, s.Oliver',
                  style: headerStyle.copyWith(fontSize: 11, color: Colors.grey),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.brandsFiltersPage);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
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
