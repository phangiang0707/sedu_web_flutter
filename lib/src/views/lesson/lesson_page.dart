import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_web_flutter/src/controller/lesson/getLesson.controller.dart';

import '../../controller/lesson/deleteLesson.controller.dart';
import '../../model/otd/lesson/getLesson.otd.dart';
import 'addLesson_page.dart';
import 'fixLesson_page.dart';

class Lesson_page extends StatefulWidget {
  const Lesson_page({super.key, required this.id});
  final String id;
  @override
  State<Lesson_page> createState() => _Lesson_pageState();
}

class _Lesson_pageState extends State<Lesson_page> {
  GetLessonController? _getLessonController;
  DeleteLessonController? _deleteLessonController;
  List<GetLessonOtd>? _listLessonOtd;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deleteLessonController = DeleteLessonController();
    _getLessonController = GetLessonController();
    _getLessonController!.getLesson(widget.id).then((value) {
      setState(() {
        _listLessonOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Center(
            child: Container(
              width: 500,
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  _getLessonController!.getLesson(widget.id).then((value) {
                    setState(() {
                      _listLessonOtd = value;
                    });
                  });
                },
                child: Column(children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new_outlined)),
                      Text(
                        "Danh sách bài học",
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
                          onPressed: () async {
                            String refresh = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddLesson_page(
                                          id: widget.id,
                                        )));
                            if (refresh == 'refresh') {
                              _refreshIndicatorKey.currentState?.show();
                            }
                          },
                          child: Text(
                            "Thêm bài học",
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
                  _listLessonOtd != null
                      ? Column(
                          children: _listLessonOtd!
                              .map((e) => Container(
                                        width: 500,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${e.title}",
                                              style: GoogleFonts.inter(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.5)),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      String refresh =
                                                          await Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          FixLesson_page(
                                                                            id: widget.id,
                                                                            lessonID:
                                                                                e.id,
                                                                            getLessonOtd:
                                                                                e,
                                                                          )));
                                                      if (refresh ==
                                                          'refresh') {
                                                        _refreshIndicatorKey
                                                            .currentState
                                                            ?.show();
                                                      }
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 235, 211, 0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        23,
                                                                        161,
                                                                        250,
                                                                        1),
                                                                blurRadius: 2,
                                                                spreadRadius: 1,
                                                                offset: Offset(
                                                                    2, 1))
                                                          ]),
                                                      child: Text(
                                                        "Sửa",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      _deleteLessonController!
                                                          .deleteLesson(
                                                              widget.id, e.id);
                                                      _refreshIndicatorKey
                                                          .currentState
                                                          ?.show();
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        23,
                                                                        161,
                                                                        250,
                                                                        1),
                                                                blurRadius: 2,
                                                                spreadRadius: 1,
                                                                offset: Offset(
                                                                    2, 1))
                                                          ]),
                                                      child: Text(
                                                        "Xóa",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  // ContainerLesson(
                                  //       getLessonOtd: e,
                                  //       id: widget.id,
                                  //     )
                                  )
                              .toList())
                      : SizedBox()
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class ContainerLesson extends StatefulWidget {
//   const ContainerLesson(
//       {super.key, required this.getLessonOtd, required this.id});
//   final GetLessonOtd getLessonOtd;
//   final String id;
//   @override
//   State<ContainerLesson> createState() => _ContainerLessonState();
// }

// class _ContainerLessonState extends State<ContainerLesson> {
//   DeleteLessonController? _deleteLessonController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _deleteLessonController = DeleteLessonController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 500,
//       margin: EdgeInsets.only(bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "${widget.getLessonOtd.title}",
//             style: GoogleFonts.inter(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color.fromRGBO(0, 0, 0, 0.5)),
//           ),
//           Container(
//             child: Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => FixLesson_page(
//                                   id: widget.id,
//                                   lessonID: widget.getLessonOtd.id,
//                                   getLessonOtd: widget.getLessonOtd,
//                                 )));
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 235, 211, 0),
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Color.fromRGBO(23, 161, 250, 1),
//                               blurRadius: 2,
//                               spreadRadius: 1,
//                               offset: Offset(2, 1))
//                         ]),
//                     child: Text(
//                       "Sửa",
//                       style: GoogleFonts.inter(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     _deleteLessonController!
//                         .deleteLesson(widget.id, widget.getLessonOtd.id);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Color.fromRGBO(23, 161, 250, 1),
//                               blurRadius: 2,
//                               spreadRadius: 1,
//                               offset: Offset(2, 1))
//                         ]),
//                     child: Text(
//                       "Xóa",
//                       style: GoogleFonts.inter(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
