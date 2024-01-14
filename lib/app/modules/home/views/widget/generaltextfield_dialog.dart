import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralTextField extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  const GeneralTextField(
      {super.key, required this.title, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14.w, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 4.w,
        ),
        TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: 'Masukkan $title',
                hintStyle: TextStyle(
                    fontSize: 14.w,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                )))
      ],
    );
  }
}
