import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/category/putCategory.controller.dart';
import '../../model/otd/category/category.otd.dart';

class FixCategory_page extends StatefulWidget {
  const FixCategory_page({super.key, required this.categoryOtd});
  final CategoryOtd categoryOtd;

  @override
  State<FixCategory_page> createState() => _FixCategory_pageState();
}

class _FixCategory_pageState extends State<FixCategory_page> {
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtDescription = TextEditingController();
  PutCategoryControllerr? putCategoryControllerr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    putCategoryControllerr = PutCategoryControllerr();
    _txtName.text = widget.categoryOtd.name;
    _txtDescription.text = widget.categoryOtd.description;
    print(_txtName.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
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
                      "Danh mục",
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
                  controller: _txtName,
                  decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //       width: 1,
                    //       color: Color.fromRGBO(23, 161, 250, 1)), //<-- SEE HERE
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Tên danh mục",
                    border: OutlineInputBorder(),
                    hintText: "Tên danh mục",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _txtDescription,
                  decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //       width: 1,
                    //       color: Color.fromRGBO(23, 161, 250, 1)), //<-- SEE HERE
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Miêu tả",
                    border: OutlineInputBorder(),
                    hintText: "Miêu tả",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    putCategoryControllerr!
                        .putCategory(widget.categoryOtd.id, _txtName.text,
                            _txtDescription.text)
                        .then((value) {
                      if (value != null) {
                        Navigator.pop(context, 'refresh');
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
                      "Sửa",
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
      ),
    );
  }
}
