import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controller/category/getCategory.controller.dart';
import '../../controller/courses/putCourses.controller.dart';
import '../../model/otd/category/category.otd.dart';
import '../../model/otd/courses/getCourse.otd.dart';
import '../../model/otd/courses/postCourse.otd.dart';

class FixCourses_page extends StatefulWidget {
  const FixCourses_page({super.key, required this.getCourseOtd});
  final GetCourseOtd getCourseOtd;
  @override
  State<FixCourses_page> createState() => _FixCourses_pageState();
}

class _FixCourses_pageState extends State<FixCourses_page> {
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtDescription = TextEditingController();
  final TextEditingController _txtRules = TextEditingController();
  final TextEditingController _txtPrice = TextEditingController();
  final TextEditingController _txtCategory = TextEditingController();
  final TextEditingController _txtstartDate = TextEditingController();
  final TextEditingController _txtendDate = TextEditingController();
  DateTime txtstartDate = DateTime.now();
  DateTime txtendDate = DateTime.now();
  CategoryController? _categoryController;
  List<CategoryOtd>? categoryOtd;
  PutCourseControllerr? _putCourseControllerr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _putCourseControllerr = PutCourseControllerr();
    _categoryController = CategoryController();
    _categoryController!.getCategory().then((value) {
      setState(() {
        categoryOtd = value;
      });
    });
    _txtName.text = widget.getCourseOtd.name;
    _txtDescription.text = widget.getCourseOtd.description;
    _txtRules.text = widget.getCourseOtd.rules;
    _txtPrice.text = widget.getCourseOtd.price.toString();
    _txtstartDate.text =
        "${widget.getCourseOtd.startDate.day}/${widget.getCourseOtd.startDate.month}/${widget.getCourseOtd.startDate.year}";
    _txtendDate.text =
        "${widget.getCourseOtd.endDate.day}/${widget.getCourseOtd.endDate.month}/${widget.getCourseOtd.endDate.year}";
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
            // categoryOtd != null
            //     ? DropdownButtonFormField(
            //         value: null,
            //         items: categoryOtd!
            //             .map((e) => DropdownMenuItem(
            //                   child: Text("${e.name}"),
            //                   value: e,
            //                 ))
            //             .toList(),
            //         onChanged: (value) {
            //           setState(() {
            //             _txtCategory.text = value!.name;
            //             categoryID = value.id;
            //           });
            //           print(categoryID);
            //         },
            //         decoration: InputDecoration(
            //           focusedBorder: OutlineInputBorder(
            //             borderSide: BorderSide(
            //                 width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
            //             borderRadius: BorderRadius.circular(15),
            //           ),
            //           labelText: "Chọn danh mục",
            //           border: OutlineInputBorder(),
            //           hintText: "Chọn danh mục",
            //         ),
            //       )
            //     : SizedBox(),
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
                _putCourseControllerr!.putCourse(
                    PostCourseOtd(
                        name: _txtName.text,
                        description: _txtDescription.text,
                        rules: _txtRules.text,
                        price: int.parse(_txtPrice.text),
                        categoryId: widget.getCourseOtd.categoryId,
                        startDate: txtstartDate,
                        endDate: txtendDate),
                    widget.getCourseOtd.id);
                Navigator.pop(context);
              },
              child: Container(
                width: 100,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(23, 161, 250, 1)),
                child: Text(
                  "Sửa",
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
