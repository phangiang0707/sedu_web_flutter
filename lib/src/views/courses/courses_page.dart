import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/courses/deleteCourses.controller.dart';
import '../../controller/courses/getCourses.controller.dart';
import '../../model/otd/courses/getCourse.otd.dart';
import '../lesson/lesson_page.dart';
import 'addCourses_page.dart';
import 'fixCourses_page.dart';

class Courses_page extends StatefulWidget {
  const Courses_page({super.key});

  @override
  State<Courses_page> createState() => _Courses_pageState();
}

class _Courses_pageState extends State<Courses_page> {
  GetCoursesController? _getCoursesController;
  List<GetCourseOtd>? _listOfCourses;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCoursesController = GetCoursesController();
    _getCoursesController!.getCourses().then((value) {
      setState(() {
        _listOfCourses = value;
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
              _getCoursesController!.getCourses().then((value) {
                setState(() {
                  _listOfCourses = value;
                });
              });
            },
            child: Column(
              children: [
                Text(
                  "Khóa học",
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
                                  builder: (context) => AddCourse_page()));
                        },
                        child: Text(
                          "Thêm khóa học",
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
                _listOfCourses != null
                    ? Container(
                        child: SingleChildScrollView(
                          child: Column(
                              children: _listOfCourses!
                                  .map((e) => ContainerCourses(
                                        getCourseOtd: e,
                                      ))
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

class ContainerCourses extends StatefulWidget {
  const ContainerCourses({super.key, required this.getCourseOtd});
  final GetCourseOtd getCourseOtd;
  @override
  State<ContainerCourses> createState() => _ContainerCoursesState();
}

class _ContainerCoursesState extends State<ContainerCourses> {
  DeleteCourseControllerr? _deleteCourseControllerr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deleteCourseControllerr = DeleteCourseControllerr();
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
            "${widget.getCourseOtd.name}",
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
                            builder: (context) => FixCourses_page(
                                  getCourseOtd: widget.getCourseOtd,
                                )));
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
                    _deleteCourseControllerr!
                        .deleteCourse(widget.getCourseOtd.id);
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
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Lesson_page(id: widget.getCourseOtd.id)));
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
