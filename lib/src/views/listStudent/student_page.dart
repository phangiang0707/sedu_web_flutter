import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_web_flutter/src/model/otd/class/getDetailClass.otd.dart';
import 'package:sedu_web_flutter/src/model/otd/users/getDetailUser.otd.dart';

import '../../controller/student/deleteStudent.controller.dart';
import '../../controller/student/getStudent.controller.dart';
import '../../controller/users/getDetailUser.controller.dart';
import '../../model/otd/student/getStuden.otd.dart';
import 'addStudent_page.dart';

class Student_page extends StatefulWidget {
  const Student_page({super.key, required this.id});
  final String id;
  @override
  State<Student_page> createState() => _Student_pageState();
}

class _Student_pageState extends State<Student_page> {
  GetStudentController? _getStudentController;
  List<GetStudentOtd>? _listStudentOtd;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStudentController = GetStudentController();
    print(widget.id);
    _getStudentController!.getStudent(widget.id).then((value) {
      setState(() {
        _listStudentOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              _getStudentController!.getStudent(widget.id).then((value) {
                setState(() {
                  _listStudentOtd = value;
                });
              });
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Danh sách học viên",
                      style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddStudent_page(
                                        id: widget.id,
                                      )));
                        },
                        child: Text(
                          "Thêm học viên",
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
                                color: Color.fromRGBO(23, 161, 250, 1)))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                _listStudentOtd != null
                    ? Container(
                        child: SingleChildScrollView(
                          child: Column(
                              children: _listStudentOtd!
                                  .map((e) => ContainerStudent(
                                      getStudentOtd: e, id: widget.id))
                                  .toList()),
                        ),
                      )
                    : CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerStudent extends StatefulWidget {
  const ContainerStudent(
      {super.key, required this.getStudentOtd, required this.id});
  final GetStudentOtd getStudentOtd;
  final String id;
  @override
  State<ContainerStudent> createState() => _ContainerStudentState();
}

class _ContainerStudentState extends State<ContainerStudent> {
  GetDetailUserController? _getDetailUserController;
  GetDetailUserOtd? _getDetailUserOtd;
  DeleteStudentController? _deleteStudentController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deleteStudentController = DeleteStudentController();
    _getDetailUserController = GetDetailUserController();
    _getDetailUserController!
        .getDetailUser(widget.getStudentOtd.userId)
        .then((value) {
      setState(() {
        _getDetailUserOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _getDetailUserOtd != null
        ? Container(
            width: 500,
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_getDetailUserOtd!.name}",
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                ),
                InkWell(
                  onTap: () {
                    _deleteStudentController!
                        .deleteStudent(_getDetailUserOtd!.id, widget.id)
                        .then((value) {
                      if (value != null) {
                        print("Done!");
                      } else {
                        print("Error!");
                      }
                    });
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
        : CircularProgressIndicator();
  }
}
