import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../controller/class/getDetailClass.controller.dart';
import '../../controller/class/putClass.controller.dart';
import '../../controller/courses/getCourses.controller.dart';
import '../../model/otd/class/getClass.otd.dart';
import '../../model/otd/class/getDetailClass.otd.dart';
import '../../model/otd/class/postClass.otd.dart';
import '../../model/otd/courses/getCourse.otd.dart';

class FixClass extends StatefulWidget {
  const FixClass({super.key, required this.id});
  final String id;
  @override
  State<FixClass> createState() => _FixClassState();
}

class _FixClassState extends State<FixClass> {
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
  PutClassController? _putClassController;
  GetDetailClassController? _getDetailClassController;
  GetDetailClassOtd? _getDetailClassOtd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _putClassController = PutClassController();
    _getCoursesController = GetCoursesController();
    _getDetailClassController = GetDetailClassController();
    _getDetailClassController!.getDetailClassOtd(widget.id).then((value) {
      setState(() {
        _getDetailClassOtd = value;

        //_txtCourseID.text = _getDetailClassOtd!.course!.id;
        if (_getDetailClassOtd!.zaloGroupChatName == null &&
            _getDetailClassOtd!.zaloGroupChatName == null) {
          _txtDescription.text = _getDetailClassOtd!.description;
          _txtRules.text = _getDetailClassOtd!.rules;
          _txtStartDate.text =
              '${_getDetailClassOtd!.startDate.day}/${_getDetailClassOtd!.startDate.month}/${_getDetailClassOtd!.startDate.year}';
          _txtEndDate.text =
              '${_getDetailClassOtd!.endDate.day}/${_getDetailClassOtd!.endDate.month}/${_getDetailClassOtd!.endDate.year}';
          _txtName.text = _getDetailClassOtd!.name;
          _txtCode.text = _getDetailClassOtd!.code;
          _txtRules.text = _getDetailClassOtd!.rules;
        } else {
          _txtDescription.text = _getDetailClassOtd!.description;
          _txtRules.text = _getDetailClassOtd!.rules;
          _txtStartDate.text =
              '${_getDetailClassOtd!.startDate.day}/${_getDetailClassOtd!.startDate.month}/${_getDetailClassOtd!.startDate.year}';
          _txtEndDate.text =
              '${_getDetailClassOtd!.endDate.day}/${_getDetailClassOtd!.endDate.month}/${_getDetailClassOtd!.endDate.year}';
          _txtName.text = _getDetailClassOtd!.name;
          _txtCode.text = _getDetailClassOtd!.code;
          _txtRules.text = _getDetailClassOtd!.rules;
        }
      });
    });
    _getCoursesController!.getCourses().then((value) {
      setState(() {
        _listCourseOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Container(
                width: 500,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context, 'refresh');
                            },
                            icon: Icon(Icons.arrow_back_ios_new_outlined)),
                        Text(
                          "Sửa lớp học",
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
                    // _listCourseOtd != null
                    //     ? DropdownButtonFormField(
                    //         value: null,
                    //         items: _listCourseOtd!
                    //             .map((e) => DropdownMenuItem(
                    //                   child: Text("${e.name}"),
                    //                   value: e,
                    //                 ))
                    //             .toList(),
                    //         onChanged: (value) {
                    //           setState(() {
                    //             _txtCourseID.text = value!.name;
                    //             courseID = value.id;
                    //           });
                    //         },
                    //         decoration: InputDecoration(
                    //           focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(
                    //                 width: 1,
                    //                 color: Color.fromRGBO(23, 161, 250, 1)),
                    //             borderRadius: BorderRadius.circular(15),
                    //           ),
                    //           labelText: "Chọn khóa học",
                    //           border: OutlineInputBorder(),
                    //           hintText: "Chọn khóa học",
                    //         ),
                    //       )
                    //     : SizedBox(),
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
                        _putClassController!.putClass(
                            widget.id,
                            PostClassOtd(
                                name: _txtName.text,
                                code: _txtCode.text,
                                description: _txtDescription.text,
                                courseId: _getDetailClassOtd!.course.id,
                                rules: _txtRules.text,
                                startDate: startDate,
                                endDate: endDate));
                        Navigator.pop(context, 'refresh');
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
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
