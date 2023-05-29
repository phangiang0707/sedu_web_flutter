import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sedu_web_flutter/src/model/otd/class/postClass.otd.dart';

import '../../controller/class/postClass.controller.dart';
import '../../controller/courses/getCourses.controller.dart';
import '../../model/otd/courses/getCourse.otd.dart';

class AddClass_page extends StatefulWidget {
  const AddClass_page({super.key});

  @override
  State<AddClass_page> createState() => _AddClass_pageState();
}

class _AddClass_pageState extends State<AddClass_page> {
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtCode = TextEditingController();
  TextEditingController _txtDescription = TextEditingController();
  TextEditingController _txtCourseID = TextEditingController();
  TextEditingController _txtRules = TextEditingController();
  TextEditingController _txtStartDate = TextEditingController();
  TextEditingController _txtEndDate = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String courseID = '';
  GetCoursesController? _getCoursesController;
  List<GetCourseOtd>? _listCourseOtd;
  PostClassController? _postClassController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postClassController = PostClassController();
    _getCoursesController = GetCoursesController();
    _getCoursesController!.getCourses().then((value) {
      setState(() {
        _listCourseOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 500,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    Text(
                      "Thêm lớp học",
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
                    labelText: "Tên lớp học",
                    border: OutlineInputBorder(),
                    hintText: "Tên lớp học",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _txtCode,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Nhập mã vào lớp",
                    border: OutlineInputBorder(),
                    hintText: "Nhập mã vào lớp",
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
                    labelText: "Nhập mô tả",
                    border: OutlineInputBorder(),
                    hintText: "Nhập mô tả",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _listCourseOtd != null
                    ? DropdownButtonFormField(
                        value: null,
                        items: _listCourseOtd!
                            .map((e) => DropdownMenuItem(
                                  child: Text("${e.name}"),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _txtCourseID.text = value!.name;
                            courseID = value.id;
                          });
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(23, 161, 250, 1)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Chọn khóa học",
                          border: OutlineInputBorder(),
                          hintText: "Chọn khóa học",
                        ),
                      )
                    : SizedBox(),
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
                    labelText: "Quy định lớp học",
                    border: OutlineInputBorder(),
                    hintText: "Quy định lớp học",
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
                        startDate = datimePicker;
                        _txtStartDate.text =
                            DateFormat('dd/MM/yyyy').format(datimePicker);
                      });
                    }
                  },
                  controller: _txtStartDate,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Chọn ngày bắt đầu lớp học",
                    border: OutlineInputBorder(),
                    hintText: "Chọn ngày bắt đầu lớp học",
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
                        endDate = datimePicker;
                        _txtEndDate.text =
                            DateFormat('dd/MM/yyyy').format(datimePicker);
                        print(datimePicker);
                      });
                    }
                  },
                  controller: _txtEndDate,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Chọn ngày kết thúc lớp học",
                    border: OutlineInputBorder(),
                    hintText: "Chọn ngày kết thúc lớp học",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _postClassController!
                        .postClass(PostClassOtd(
                            name: _txtName.text,
                            code: _txtCode.text,
                            description: _txtDescription.text,
                            courseId: courseID,
                            rules: _txtRules.text,
                            startDate: startDate,
                            endDate: endDate))
                        .then((value) {
                      Navigator.pop(context);
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
              ],
            )),
      ),
    );
  }
}
