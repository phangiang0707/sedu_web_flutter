import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_web_flutter/src/model/otd/class/getClass.otd.dart';
import 'package:sedu_web_flutter/src/views/class/fixClass_page.dart';

import '../../controller/class/deleteClass.controller.dart';
import '../../controller/class/getClass.controller.dart';
import '../listStudent/student_page.dart';
import 'addClass_page.dart';
import 'listStudent_Teacher_page.dart';

class Class_page extends StatefulWidget {
  const Class_page({super.key});

  @override
  State<Class_page> createState() => _Class_pageState();
}

class _Class_pageState extends State<Class_page> {
  GetClassController? _getClassController;
  DeleteClassController? _deleteClassController;
  List<GetClassOtd> _listClassOtd = [];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deleteClassController = DeleteClassController();
    _getClassController = GetClassController();
    _getClassController!.getClass().then((value) {
      setState(() {
        _listClassOtd = value!;
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
                  _getClassController!.getClass().then((value) {
                    setState(() {
                      _listClassOtd = value!;
                    });
                  });
                },
                child: Column(children: [
                  Text(
                    "Lớp học",
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () async {
                            String refresh = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddClass_page()));
                            if (refresh == 'refresh') {
                              _refreshIndicatorKey.currentState?.show();
                            }
                          },
                          child: Text(
                            "Thêm lớp học",
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
                  _listClassOtd != null
                      ? Container(
                          child: SingleChildScrollView(
                            child: Column(
                                children: _listClassOtd
                                    .map((e) => Container(
                                              width: 500,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${e.name}",
                                                    style: GoogleFonts.inter(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                                                        builder: (context) => FixClass(
                                                                              id: e.id,
                                                                            )));
                                                            if (refresh ==
                                                                'refresh') {
                                                              _refreshIndicatorKey
                                                                  .currentState
                                                                  ?.show();
                                                            }
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        5),
                                                            decoration: BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        235,
                                                                        211,
                                                                        0),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          23,
                                                                          161,
                                                                          250,
                                                                          1),
                                                                      blurRadius:
                                                                          2,
                                                                      spreadRadius:
                                                                          1,
                                                                      offset:
                                                                          Offset(
                                                                              2,
                                                                              1))
                                                                ]),
                                                            child: Text(
                                                              "Sửa",
                                                              style: GoogleFonts.inter(
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
                                                            _deleteClassController!
                                                                .deleteClass(
                                                                    e.id)
                                                                .then((value) {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                            _refreshIndicatorKey
                                                                .currentState
                                                                ?.show();
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        5),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          23,
                                                                          161,
                                                                          250,
                                                                          1),
                                                                      blurRadius:
                                                                          2,
                                                                      spreadRadius:
                                                                          1,
                                                                      offset:
                                                                          Offset(
                                                                              2,
                                                                              1))
                                                                ]),
                                                            child: Text(
                                                              "Xóa",
                                                              style: GoogleFonts.inter(
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
                                                        IconButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ListStudent_Teacher_page(
                                                                              id: e.id)));
                                                              print(
                                                                  "aaaaaaaaaaaaaaaaaaa" +
                                                                      e.id);
                                                            },
                                                            icon: Icon(Icons
                                                                .arrow_forward_ios_outlined))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                        // ContainerClass(
                                        //       getClassOtd: e,
                                        //     )
                                        )
                                    .toList()),
                          ),
                        )
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

// class ContainerClass extends StatefulWidget {
//   const ContainerClass({super.key, required this.getClassOtd});
//   final GetClassOtd getClassOtd;
//   @override
//   State<ContainerClass> createState() => _ContainerClassState();
// }

// class _ContainerClassState extends State<ContainerClass> {
//   DeleteClassController? _deleteClassController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _deleteClassController = DeleteClassController();
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
//             "${widget.getClassOtd.name}",
//             style: GoogleFonts.inter(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color.fromRGBO(0, 0, 0, 0.5)),
//           ),
//           Container(
//             child: Row(
//               children: [
//                 InkWell(
//                   onTap: () async {
//                     String refresh = await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => FixClass(
//                                   id: widget.getClassOtd.id,
//                                 )));
//                                 if(refresh=='refresh')
//                                 {}
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
//                     _deleteClassController!
//                         .deleteClass(widget.getClassOtd.id)
//                         .then((value) {
//                       Navigator.pop(context);
//                     });
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
//                 IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ListStudent_Teacher_page(
//                                   id: widget.getClassOtd.id)));
//                       print("aaaaaaaaaaaaaaaaaaa" + widget.getClassOtd.id);
//                     },
//                     icon: Icon(Icons.arrow_forward_ios_outlined))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
