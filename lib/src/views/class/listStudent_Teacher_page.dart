import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            title: Text('Danh sách lớp học'),
          ),
          body: TabBarView(
            children: [
              Timings_page(
                id: widget.id,
              ),
              Student_page(id: widget.id),
              Teacher_page(id: widget.id)
            ],
          )),
    );
  }
}
