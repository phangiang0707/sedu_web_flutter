import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sedu_web_flutter/src/model/otd/courses/postCourse.otd.dart';

import '../../controller/category/getCategory.controller.dart';
import '../../controller/courses/postCourses.controller.dart';
import '../../model/otd/category/category.otd.dart';

class AddCourse_page extends StatefulWidget {
  const AddCourse_page({super.key});

  @override
  State<AddCourse_page> createState() => _AddCourse_pageState();
}

class _AddCourse_pageState extends State<AddCourse_page> {
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtDescription = TextEditingController();
  final TextEditingController _txtRules = TextEditingController();
  final TextEditingController _txtPrice = TextEditingController();
  final TextEditingController _txtCategory = TextEditingController();
  final TextEditingController _txtstartDate = TextEditingController();
  final TextEditingController _txtendDate = TextEditingController();
  DateTime txtstartDate = DateTime.now();
  DateTime txtendDate = DateTime.now();
  String categoryID = '';
  CategoryController? _categoryController;
  List<CategoryOtd>? categoryOtd;
  PostCourseControllerr? _postCourseControllerr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postCourseControllerr = PostCourseControllerr();
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
      body: Center(
        child: Container(
          width: 500,
          child: Column(children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
                Text(
                  "Khóa học",
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _txtName,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Tên khóa học",
                border: OutlineInputBorder(),
                hintText: "Tên khóa học",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _txtDescription,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Miêu tả",
                border: OutlineInputBorder(),
                hintText: "Miêu tả",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _txtRules,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Điều khoản",
                border: OutlineInputBorder(),
                hintText: "Điều khoản",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _txtPrice,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Giá khóa học",
                border: OutlineInputBorder(),
                hintText: "Giá khóa học",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            categoryOtd != null
                ? DropdownButtonFormField(
                    value: null,
                    items: categoryOtd!
                        .map((e) => DropdownMenuItem(
                              child: Text("${e.name}"),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _txtCategory.text = value!.name;
                        categoryID = value.id;
                      });
                      print(categoryID);
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Chọn danh mục",
                      border: OutlineInputBorder(),
                      hintText: "Chọn danh mục",
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onTap: () async {
                DateTime? datimePicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));
                if (datimePicker != null) {
                  setState(() {
                    txtstartDate = datimePicker;
                    _txtstartDate.text =
                        DateFormat('dd/MM/yyyy').format(datimePicker);
                  });
                }
              },
              controller: _txtstartDate,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Chọn ngày bắt đầu khóa học",
                border: OutlineInputBorder(),
                hintText: "Chọn ngày bắt đầu khóa học",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onTap: () async {
                DateTime? datimePicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));
                if (datimePicker != null) {
                  setState(() {
                    txtendDate = datimePicker;
                    _txtendDate.text =
                        DateFormat('dd/MM/yyyy').format(datimePicker);
                    print(datimePicker);
                  });
                }
              },
              controller: _txtendDate,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Chọn ngày kết thúc khóa học",
                border: OutlineInputBorder(),
                hintText: "Chọn ngày kết thúc khóa học",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _postCourseControllerr!
                    .postCourse(PostCourseOtd(
                        name: _txtName.text,
                        description: _txtDescription.text,
                        rules: _txtRules.text,
                        price: int.parse(_txtPrice.text),
                        categoryId: _txtCategory.text,
                        startDate: txtstartDate,
                        endDate: txtendDate))
                    .then((value) {
                  if (value != null) {
                    Navigator.pop(context);
                  } else {
                    print("Null value");
                  }
                });
              },
              child: Container(
                width: 100,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(23, 161, 250, 1)),
                child: Text(
                  "Thêm",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
