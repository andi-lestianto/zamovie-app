import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralTextField extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final bool? isNumeric;
  final int? maxLines;
  const GeneralTextField(
      {super.key,
      required this.title,
      required this.textEditingController,
      this.isNumeric = false,
      this.maxLines});

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
            maxLines: maxLines,
            keyboardType: isNumeric == true ? TextInputType.number : null,
            inputFormatters: isNumeric == true
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  ]
                : null,
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
