import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedu_web_flutter/src/model/otd/timings/postTiming.otd.dart';

import '../../controller/teacher/teacher.controller.dart';
import '../../controller/timings/postTimings.controller.dart';
import '../../controller/users/getDetailUser.controller.dart';
import '../../model/otd/teacher/teacher.otd.dart';
import '../../model/otd/users/getDetailUser.otd.dart';

class AddTimnigs_page extends StatefulWidget {
  const AddTimnigs_page({super.key, required this.id});
  final String id;
  @override
  State<AddTimnigs_page> createState() => _AddTimnigs_pageState();
}

class _AddTimnigs_pageState extends State<AddTimnigs_page> {
  int setDay = 0;
  TextEditingController _txtStartTime = TextEditingController();
  TextEditingController _txtEndTime = TextEditingController();
  TextEditingController _txtTeacher = TextEditingController();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  PostTimingsController? _postTimingsController;
  GetTeacherController? _getTeacherController;
  List<GetTeacherOtd>? _listTeacherOtd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postTimingsController = PostTimingsController();
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
        child: Column(children: [
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
          _listTeacherOtd != null
              ? DropdownButtonFormField(
                  value: null,
                  items: _listTeacherOtd!
                      .map((e) => DropdownMenuItem(
                            child: ContainerUser(getTeacherOtd: e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _txtTeacher.text = value!.userId;
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Chọn giáo viên",
                    border: OutlineInputBorder(),
                    hintText: "Chọn giáo viên",
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          DropdownButtonFormField(
            items: [
              DropdownMenuItem(child: Text("Thứ 2"), value: 0),
              DropdownMenuItem(child: Text("Thứ 3"), value: 1),
              DropdownMenuItem(child: Text("Thứ 4"), value: 2),
              DropdownMenuItem(child: Text("Thứ 5"), value: 3),
              DropdownMenuItem(child: Text("Thứ 6"), value: 4),
              DropdownMenuItem(child: Text("Thứ 7"), value: 5),
              DropdownMenuItem(child: Text("Chủ nhật"), value: 6),
            ],
            onChanged: (value) {
              setState(() {
                setDay = value!;
              });
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: "Chọn ngày (Thứ 2 - Chủ nhật)",
              border: OutlineInputBorder(),
              hintText: "Chọn ngày (Thứ 2 - Chủ nhật)",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _txtStartTime,
                  onTap: () async {
                    TimeOfDay? newTime = await showTimePicker(
                        context: context, initialTime: startTime);
                    if (newTime != null) {
                      setState(() {
                        _txtStartTime.text =
                            '${newTime.hour}:${newTime.minute}';
                      });
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Chọn giờ bắt đầu",
                    border: OutlineInputBorder(),
                    hintText: "Chọn giờ bắt đầu",
                  ),
                ),
              ),
              SizedBox(
                width: 25,
                child: Center(
                  child: Text("-"),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: _txtEndTime,
                  onTap: () async {
                    TimeOfDay? newTime = await showTimePicker(
                        context: context, initialTime: endTime);
                    if (newTime != null) {
                      setState(() {
                        _txtEndTime.text = '${newTime.hour}:${newTime.minute}';
                      });
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Chọn giờ kết thúc",
                    border: OutlineInputBorder(),
                    hintText: "Chọn giờ kết thúc",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  _postTimingsController!
                      .postTimings(
                          PostTimingsOtd(
                              teacherId: _txtTeacher.text,
                              day: setDay,
                              startTime: _txtStartTime.text,
                              endTime: _txtEndTime.text),
                          widget.id)
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
          ),
        ]),
      )),
    );
  }
}

class ContainerUser extends StatefulWidget {
  const ContainerUser({super.key, required this.getTeacherOtd});
  final GetTeacherOtd getTeacherOtd;
  @override
  State<ContainerUser> createState() => _ContainerUserState();
}

class _ContainerUserState extends State<ContainerUser> {
  GetDetailUserController? _getDetailUserController;
  GetDetailUserOtd? _getDetailUserOtd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        ? Text(_getDetailUserOtd!.name)
        : CircularProgressIndicator();
  }
}
