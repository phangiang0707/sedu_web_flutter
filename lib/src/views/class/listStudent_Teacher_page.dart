import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/class/createGroupChat.controller.dart';
import '../../controller/class/getDetailClass.controller.dart';
import '../../controller/class/removeGroupChat.controller.dart';
import '../../model/otd/class/getDetailClass.otd.dart';
import '../listStudent/student_page.dart';
import '../listTeacher/teacher_page.dart';
import '../timings/timings_page.dart';

class ListStudent_Teacher_page extends StatefulWidget {
  const ListStudent_Teacher_page({super.key, required this.id});
  final String id;
  @override
  State<ListStudent_Teacher_page> createState() =>
      _ListStudent_Teacher_pageState();
}

class _ListStudent_Teacher_pageState extends State<ListStudent_Teacher_page> {
  int isChoice = 0;
  CreateGroupChatController? _createGroupChatController;
  RemoveGroupChatController? _removeGroupChatController;
  GetDetailClassController? _getDetailClassController;
  GetDetailClassOtd? getDetailClassOtd;
  String error = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDetailClassController = GetDetailClassController();
    _createGroupChatController = CreateGroupChatController();
    _removeGroupChatController = RemoveGroupChatController();
    _getDetailClassController!.getDetailClassOtd(widget.id).then((value) {
      setState(() {
        getDetailClassOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: getDetailClassOtd != null
            ? Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        text: "Lịch học",
                      ),
                      Tab(
                        text: "Học viên",
                      ),
                      Tab(
                        text: "Giáo viên",
                      ),
                    ],
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Danh sách lớp học'),
                      getDetailClassOtd!.zaloGroupChatUrl == null
                          ? InkWell(
                              onTap: () {
                                _createGroupChatController!
                                    .createGroupChat(widget.id)
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      error = "Tạo nhóm chat thành công";
                                    });
                                  } else {
                                    setState(() {
                                      error = "Lỗi khi tạo";
                                    });
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 145, 255, 1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                child: Text(
                                  "Tạo nhóm chat",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                _removeGroupChatController!
                                    .removeGroupChat(widget.id)
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      error = "Xóa nhóm chat thành công";
                                    });
                                  } else {
                                    setState(() {
                                      error = "Lỗi khi xóa";
                                    });
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                child: Text(
                                  "Xóa nhóm chat",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Timings_page(
                      id: widget.id,
                    ),
                    Student_page(id: widget.id),
                    Teacher_page(id: widget.id)
                  ],
                ))
            : Center(
                child: Container(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator())));
  }
}
