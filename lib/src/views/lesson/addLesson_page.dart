import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:sedu_web_flutter/src/model/otd/lesson/postLesson.otd.dart';
import '../../controller/lesson/postLesson.controller.dart';

class AddLesson_page extends StatefulWidget {
  const AddLesson_page({super.key, required this.id});
  final String id;
  @override
  State<AddLesson_page> createState() => _AddLesson_pageState();
}

class _AddLesson_pageState extends State<AddLesson_page> {
  TextEditingController _txtLessonNo = TextEditingController();
  TextEditingController _txtTitle = TextEditingController();
  TextEditingController _txtContent = TextEditingController();
  TextEditingController _txtType = TextEditingController();
  bool enabled = false;
  PostLessonController? _postLessonController;
  HtmlEditorController _controller = HtmlEditorController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postLessonController = PostLessonController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_outlined)),
                  Text(
                    "Bài học",
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
              TextFormField(
                controller: _txtLessonNo,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Thứ tự bài học",
                  border: OutlineInputBorder(),
                  hintText: "Thứ tự bài học",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _txtTitle,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Tên bài học",
                  border: OutlineInputBorder(),
                  hintText: "Tên bài học",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                //height: 100,
                child: HtmlEditor(
                  controller: _controller,
                  htmlEditorOptions: HtmlEditorOptions(hint: "Hint text"),
                ),
              ),
              // TextFormField(
              //   controller: _txtContent,
              //   decoration: InputDecoration(
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //           width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //     labelText: "Nội dung bài học",
              //     border: OutlineInputBorder(),
              //     hintText: "Nội dung bài học",
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _txtType,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Định dạng bài học",
                  border: OutlineInputBorder(),
                  hintText: "Định dạng bài học",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Bật/tắt bài học",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(23, 161, 250, 1)),
                ),
              ),
              ListTile(
                title: const Text('Bật'),
                leading: Radio(
                  value: true,
                  groupValue: enabled,
                  onChanged: (value) {
                    setState(() {
                      enabled = true;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Tắt'),
                leading: Radio(
                  value: false,
                  groupValue: enabled,
                  onChanged: (value) {
                    setState(() {
                      enabled = false;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print(widget.id);
                  _postLessonController!
                      .postLessonOtd(
                          PostLessonOtd(
                              lessonNo: int.parse(_txtLessonNo.text),
                              title: _txtTitle.text,
                              content: _txtContent.text,
                              type: _txtType.text,
                              enabled: enabled),
                          widget.id)
                      .then((value) {
                    if (value != null) {
                      Navigator.pop(context);
                    } else {
                      print(
                        '${int.parse(_txtLessonNo.text)}"   " ${_txtTitle.text}"   "${_txtContent.text}"   "${_txtType.text}"   "${enabled}',
                      );
                      print("Không thêm được bài học");
                    }
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
            ]),
          ),
        ),
      ),
    );
  }
}
