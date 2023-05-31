import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_web_flutter/src/model/otd/teacher/teacher.otd.dart';
import 'package:sedu_web_flutter/src/views/listTeacher/addTeacher_page.dart';

import '../../controller/teacher/deleteTeacher.controller.dart';
import '../../controller/teacher/teacher.controller.dart';
import '../../controller/users/getDetailUser.controller.dart';
import '../../model/otd/users/getDetailUser.otd.dart';

class Teacher_page extends StatefulWidget {
  const Teacher_page({super.key, required this.id});
  final String id;
  @override
  State<Teacher_page> createState() => _Teacher_pageState();
}

class _Teacher_pageState extends State<Teacher_page> {
  GetTeacherController? _getTeacherController;
  List<GetTeacherOtd>? _listTeacherOtd;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTeacherController = GetTeacherController();
    _getTeacherController!.getTeacher(widget.id).then((value) {
      setState(() {
        _listTeacherOtd = value;
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
              _getTeacherController!.getTeacher(widget.id).then((value) {
                setState(() {
                  _listTeacherOtd = value;
                });
              });
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Danh sách giáo viên",
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
                                  builder: (context) => AddTeacher_page(
                                        id: widget.id,
                                      )));
                        },
                        child: Text(
                          "Thêm giáo viên",
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
                _listTeacherOtd != null
                    ? Container(
                        child: SingleChildScrollView(
                          child: Column(
                              children: _listTeacherOtd!
                                  .map((e) => ContainerTeacher(
                                        getTeacherOtd: e,
                                        id: widget.id,
                                      ))
                                  .toList()),
                        ),
                      )
                    : CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerTeacher extends StatefulWidget {
  const ContainerTeacher(
      {super.key, required this.getTeacherOtd, required this.id});
  final GetTeacherOtd getTeacherOtd;
  final String id;
  @override
  State<ContainerTeacher> createState() => _ContainerTeacherState();
}

class _ContainerTeacherState extends State<ContainerTeacher> {
  GetDetailUserController? _getDetailUserController;
  GetDetailUserOtd? _getDetailUserOtd;
  DeleteTeacherController? _deleteTeacherController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deleteTeacherController = DeleteTeacherController();
    _getDetailUserController = GetDetailUserController();
    _getDetailUserController!
        .getDetailUser(widget.getTeacherOtd.userId)
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
                    _deleteTeacherController!
                        .deleteTeacher(_getDetailUserOtd!.id, widget.id)
                        .then((value) {
                      if (value != null) {
                        if (value != null) {
                          print("Done!");
                        } else {
                          print("Error!");
                        }
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
