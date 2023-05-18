import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_web_flutter/src/model/otd/category/category.otd.dart';

import '../../controller/category/deleteCategory.controller.dart';
import '../../controller/category/getCategory.controller.dart';
import 'addCategory_page.dart';
import 'fixCategory_page.dart';

class Category_page extends StatefulWidget {
  const Category_page({super.key});

  @override
  State<Category_page> createState() => _Category_pageState();
}

class _Category_pageState extends State<Category_page> {
  CategoryController? _categoryController;
  List<CategoryOtd>? categoryOtd;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryController = CategoryController();
    _categoryController!.getCategory().then((value) {
      setState(() {
        categoryOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categoryOtd != null
          ? Center(
              child: Container(
                width: 500,
                child: RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: () async {
                    _categoryController!.getCategory().then((value) {
                      setState(() {
                        categoryOtd = value;
                      });
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Danh mục",
                        style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddCategory_page()));
                              },
                              child: Text(
                                "Thêm danh mục",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(23, 161, 250, 1)),
                              )),
                          TextButton(
                              onPressed: () {
                                _refreshIndicatorKey.currentState?.show();
                              },
                              child: Text("Tải lại",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(23, 161, 250, 1))))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: categoryOtd!
                              .map((e) => ContainerCategory(categoryOtd: e))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class ContainerCategory extends StatefulWidget {
  const ContainerCategory({super.key, required this.categoryOtd});
  final CategoryOtd categoryOtd;
  @override
  State<ContainerCategory> createState() => _ContainerCategoryState();
}

class _ContainerCategoryState extends State<ContainerCategory> {
  DeleteCategoryControllerr? _deleteCategoryControllerr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deleteCategoryControllerr = DeleteCategoryControllerr();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.categoryOtd.name}",
            style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 0.5)),
          ),
          Container(
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FixCategory_page(
                                categoryOtd: widget.categoryOtd)));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 235, 211, 0),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(23, 161, 250, 1),
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(2, 1))
                        ]),
                    child: Text(
                      "Sửa",
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    _deleteCategoryControllerr!
                        .deleteCategory(widget.categoryOtd.id);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(23, 161, 250, 1),
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(2, 1))
                        ]),
                    child: Text(
                      "Xóa",
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
