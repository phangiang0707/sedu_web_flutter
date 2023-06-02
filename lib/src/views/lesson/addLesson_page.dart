import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
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
  final customToolBarList = [
    ToolBarStyle.size,
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
    //ToolBarStyle.image,
  ];
  //HtmlEditorController controllerr = HtmlEditorController();
  final QuillEditorController controller = QuillEditorController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postLessonController = PostLessonController();
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
                          Navigator.pop(context, 'refresh');
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
                QuillHtmlEditor(
                    hintText: 'Hint text goes here',
                    controller: controller,
                    isEnabled: true,
                    minHeight: 300,
                    hintTextAlign: TextAlign.start,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    hintTextPadding: EdgeInsets.zero,
                    // onFocusChanged: (hasFocus) =>
                    //     debugPrint('has focus $hasFocus'),
                    // onTextChanged: (text) =>
                    //     debugPrint('widget text change $text'),
                    // onEditorCreated: () =>
                    //     debugPrint('Editor has been loaded'),
                    // onEditorResized: (height) =>
                    //     debugPrint('Editor resized $height'),
                    onSelectionChanged: (sel) =>
                        debugPrint('${sel.index},${sel.length}')),

                ToolBar(
                    controller: controller, toolBarConfig: customToolBarList),
                // HtmlEditor(
                //   controller: controllerr, //required
                //   htmlEditorOptions: HtmlEditorOptions(
                //     hint: "Type you Text here",
                //   ),
                //   htmlToolbarOptions:
                //       HtmlToolbarOptions(toolbarType: ToolbarType.nativeGrid),
                //   otherOptions: OtherOptions(
                //     height: 400,
                //   ),
                // ),
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
                    print(widget.id);
                    String? htmlText = await controller.getText();
                    print('${htmlText}');
                    _postLessonController!
                        .postLessonOtd(
                            PostLessonOtd(
                                lessonNo: int.parse(_txtLessonNo.text),
                                title: _txtTitle.text,
                                content: htmlText,
                                type: _txtType.text,
                                enabled: enabled),
                            widget.id)
                        .then((value) {
                      if (value != null) {
                        Navigator.pop(context, 'refresh');
                        print(
                          '${int.parse(_txtLessonNo.text)}"   " ${_txtTitle.text}"   "${htmlText}"   "${_txtType.text}"   "${enabled}',
                        );
                      } else {
                        print(
                          '${int.parse(_txtLessonNo.text)}"   " ${_txtTitle.text}"   "${htmlText}"   "${_txtType.text}"   "${enabled}',
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
                ),
                SizedBox(
                  height: 20,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
