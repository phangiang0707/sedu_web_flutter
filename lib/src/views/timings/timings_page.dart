import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/timings/deleteTimings.controller.dart';
import '../../controller/timings/getTimings.controller.dart';
import '../../model/otd/timings/getTiming.otd.dart';
import 'addTimings_page.dart';

class Timings_page extends StatefulWidget {
  const Timings_page({super.key, required this.id});
  final String id;
  @override
  State<Timings_page> createState() => _Timings_pageState();
}

class _Timings_pageState extends State<Timings_page> {
  GetTimingsController? _getTimingsController;
  List<GetTimingsOtd>? _listTimingsOtd;
  List<GetTimingsOtd> _listTimings2 = [];
  List<GetTimingsOtd> _listTimings3 = [];
  List<GetTimingsOtd> _listTimings4 = [];
  List<GetTimingsOtd> _listTimings5 = [];
  List<GetTimingsOtd> _listTimings6 = [];
  List<GetTimingsOtd> _listTimings7 = [];
  List<GetTimingsOtd> _listTimingsCN = [];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTimingsController = GetTimingsController();
    _getTimingsController!.getTiming(widget.id).then((value) {
      setState(() {
        _listTimingsOtd = value;
        _listTimingsOtd!.forEach((element) {
          if (element.day == 0) {
            _listTimings2.add(element);
          } else if (element.day == 1) {
            _listTimings3.add(element);
          } else if (element.day == 2) {
            _listTimings4.add(element);
          } else if (element.day == 3) {
            _listTimings5.add(element);
          } else if (element.day == 4) {
            _listTimings6.add(element);
          } else if (element.day == 5) {
            _listTimings7.add(element);
          } else if (element.day == 6) {
            _listTimingsCN.add(element);
          }
        });
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
              _getTimingsController!.getTiming(widget.id).then((value) {
                setState(() {
                  _listTimings2.clear();
                  _listTimings3.clear();
                  _listTimings4.clear();
                  _listTimings5.clear();
                  _listTimings6.clear();
                  _listTimings7.clear();
                  _listTimingsCN.clear();
                  _listTimingsOtd!.clear();
                  _listTimingsOtd = value;
                  _listTimingsOtd!.forEach((element) {
                    if (element.day == 0) {
                      _listTimings2.add(element);
                    } else if (element.day == 1) {
                      _listTimings3.add(element);
                    } else if (element.day == 2) {
                      _listTimings4.add(element);
                    } else if (element.day == 3) {
                      _listTimings5.add(element);
                    } else if (element.day == 4) {
                      _listTimings6.add(element);
                    } else if (element.day == 5) {
                      _listTimings7.add(element);
                    } else if (element.day == 6) {
                      _listTimingsCN.add(element);
                    }
                  });
                });
              });
            },
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "Lịch học",
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
                                  builder: (context) => AddTimnigs_page(
                                        id: widget.id,
                                      )));
                        },
                        child: Text(
                          "Thêm lịch học",
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
                Text(
                  "Thứ 2",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Divider(),
                _listTimings2 != null
                    ? Column(
                        children: _listTimings2
                            .map((e) => ContainerTimings(
                                  getTimingsOtd: e,
                                  id: widget.id,
                                ))
                            .toList(),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Thứ 3",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Divider(),
                _listTimings2 != null
                    ? Column(
                        children: _listTimings3
                            .map((e) => ContainerTimings(
                                  getTimingsOtd: e,
                                  id: widget.id,
                                ))
                            .toList(),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Thứ 4",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Divider(),
                _listTimings2 != null
                    ? Column(
                        children: _listTimings4
                            .map((e) => ContainerTimings(
                                  getTimingsOtd: e,
                                  id: widget.id,
                                ))
                            .toList(),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Thứ 5",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Divider(),
                _listTimings2 != null
                    ? Column(
                        children: _listTimings5
                            .map((e) => ContainerTimings(
                                  getTimingsOtd: e,
                                  id: widget.id,
                                ))
                            .toList(),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Thứ 6",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Divider(),
                _listTimings2 != null
                    ? Column(
                        children: _listTimings6
                            .map((e) => ContainerTimings(
                                  getTimingsOtd: e,
                                  id: widget.id,
                                ))
                            .toList(),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Thứ 7",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Divider(),
                _listTimings2 != null
                    ? Column(
                        children: _listTimings7
                            .map((e) => ContainerTimings(
                                  getTimingsOtd: e,
                                  id: widget.id,
                                ))
                            .toList(),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Chủ nhật",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Divider(),
                _listTimings2 != null
                    ? Column(
                        children: _listTimingsCN
                            .map((e) => ContainerTimings(
                                  getTimingsOtd: e,
                                  id: widget.id,
                                ))
                            .toList(),
                      )
                    : SizedBox(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerTimings extends StatefulWidget {
  const ContainerTimings(
      {super.key, required this.getTimingsOtd, required this.id});
  final GetTimingsOtd getTimingsOtd;
  final String id;
  @override
  State<ContainerTimings> createState() => _ContainerTimingsState();
}

class _ContainerTimingsState extends State<ContainerTimings> {
  DeleteTimingsController? _deleteTimingsController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deleteTimingsController = DeleteTimingsController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(23, 161, 250, 1), width: 1),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
            '${widget.getTimingsOtd.startTime} - ${widget.getTimingsOtd.endTime}'),
        InkWell(
          onTap: () {
            _deleteTimingsController!
                .deleteTimings(widget.getTimingsOtd.id, widget.id);
            // _deleteClassController!
            //     .deleteClass(widget.getClassOtd.id)
            //     .then((value) {
            //   Navigator.pop(context);
            // });
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
      ]),
    );
  }
}
