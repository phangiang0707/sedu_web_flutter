import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/teacher/postTeacher.controller.dart';
import '../../controller/users/getUser.controller.dart';
import '../../model/otd/users/user.otd.dart';

class AddTeacher_page extends StatefulWidget {
  const AddTeacher_page({super.key, required this.id});
  final String id;
  @override
  State<AddTeacher_page> createState() => _AddTeacher_pageState();
}

class _AddTeacher_pageState extends State<AddTeacher_page> {
  GetUserController? _getUserController;
  List<UserOtd>? _userOtd;
  List<UserOtd>? _listUserOtd;
  List<String> listUser = [];
  TextEditingController _txtName = TextEditingController();
  String id = '';
  String error = '';
  PostTeacherController? _postTeacherController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postTeacherController = PostTeacherController();
    _getUserController = GetUserController();
    _getUserController!.getUser().then((value) {
      setState(() {
        _userOtd = value;
        _listUserOtd = _userOtd;
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
              child: Column(children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    Text(
                      "Thêm giáo viên",
                      style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ],
                ),
                TextFormField(
                  onChanged: (text) {
                    text = text.toLowerCase();
                    setState(() {
                      _listUserOtd = _userOtd!.where((element) {
                        var postitle = element.name.toLowerCase();
                        return postitle.contains(text);
                      }).toList();
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Tìm kiếm",
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1,
                            color:
                                Color.fromRGBO(23, 161, 250, 1)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                        borderRadius: BorderRadius.circular(15),
                      )),
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: _txtName,
                        readOnly: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(23, 161, 250, 1)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(23, 161, 250, 1)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Tên học viên",
                          border: OutlineInputBorder(),
                          hintText: "Tên học viên",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: () {
                            _postTeacherController!
                                .postTeacher(id, widget.id)
                                .then((value) {
                              if (value != null) {
                                setState(() {
                                  error = 'Thêm thành công';
                                });
                              } else {
                                setState(() {
                                  error = 'Lỗi';
                                });
                              }
                            });
                          },
                          child: Text(
                            "Thêm giáo viên",
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(23, 161, 250, 1)),
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Tải lại",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(23, 161, 250, 1)))),
                    )
                  ],
                ),
                Text(
                  error,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                _listUserOtd != null
                    ? Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: _listUserOtd!
                                .map((e) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          id = e.id;
                                          _txtName.text = e.name;
                                        });
                                      },
                                      child: Container(
                                        width: 500,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 250, 250),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      23, 161, 250, 1),
                                                  blurRadius: 2,
                                                  spreadRadius: 1,
                                                  offset: Offset(2, 1))
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${e.name}",
                                              style: GoogleFonts.inter(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.5)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    : CircularProgressIndicator()
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
