import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
// import 'package:html_editor_enhanced/html_editor.dart';
import 'package:sedu_web_flutter/src/model/otd/lesson/postLesson.otd.dart';

import '../../controller/lesson/putLesson.controller.dart';
import '../../model/otd/lesson/getLesson.otd.dart';

class FixLesson_page extends StatefulWidget {
  const FixLesson_page(
      {super.key,
      required this.id,
      required this.lessonID,
      required this.getLessonOtd});
  final String id;
  final String lessonID;
  final GetLessonOtd getLessonOtd;
  @override
  State<FixLesson_page> createState() => _FixLesson_pageState();
}

class _FixLesson_pageState extends State<FixLesson_page> {
  TextEditingController _txtLessonNo = TextEditingController();
  TextEditingController _txtTitle = TextEditingController();
  TextEditingController _txtContent = TextEditingController();
  TextEditingController _txtType = TextEditingController();
  String txtContent = '';
  final QuillEditorController controller = QuillEditorController();
  final customToolBarList = [
    ToolBarStyle.size,
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
    //ToolBarStyle.image,
  ];
  //HtmlEditorController controller = HtmlEditorController();
  bool enabled = false;
  PutLessonController? _putLessonController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _putLessonController = PutLessonController();
    _txtLessonNo.text = widget.getLessonOtd.lessonNo.toString();
    _txtTitle.text = widget.getLessonOtd.title;
    _txtContent.text = widget.getLessonOtd.content;
    _txtType.text = widget.getLessonOtd.type;
    enabled = widget.getLessonOtd.enabled;
    txtContent = widget.getLessonOtd.content;
    //controller.setText(widget.getLessonOtd.content);
    //controller.insertText(widget.getLessonOtd.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                            Navigator.pop(context, 'refresh');
                          },
                          icon: Icon(Icons.arrow_back_ios_new_outlined)),
                      Text(
                        "Sửa bài học",
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
                  SingleChildScrollView(
                    child: Container(
                      height: 300,
                      child: QuillHtmlEditor(
                          text: txtContent,
                          hintText: 'Hint text goes here',
                          controller: controller,
                          isEnabled: true,
                          minHeight: 300,
                          hintTextAlign: TextAlign.start,
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          hintTextPadding: EdgeInsets.zero,
                          onSelectionChanged: (sel) =>
                              debugPrint('${sel.index},${sel.length}')),
                    ),
                  ),

                  ToolBar(
                      controller: controller, toolBarConfig: customToolBarList),
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
                    onTap: () async {
                      String? htmlText = await controller.getText();
                      _putLessonController!
                          .putLessonController(
                              widget.id,
                              widget.lessonID,
                              PostLessonOtd(
                                  lessonNo: int.parse(_txtLessonNo.text),
                                  title: _txtTitle.text,
                                  content: htmlText,
                                  type: _txtType.text,
                                  enabled: enabled))
                          .then((value) => {Navigator.pop(context, 'refresh')});
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(23, 161, 250, 1)),
                      child: Text(
                        "Sửa",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
