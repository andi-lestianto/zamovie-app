import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralTextField extends StatefulWidget {
  final String title;
  final TextEditingController textEditingController;
  final bool? isNumeric;
  final int? maxLines;
  final bool? isPassword;
  const GeneralTextField(
      {super.key,
      required this.title,
      required this.textEditingController,
      this.isNumeric = false,
      this.isPassword = false,
      this.maxLines});

  @override
  State<GeneralTextField> createState() => _GeneralTextFieldState();
}

class _GeneralTextFieldState extends State<GeneralTextField> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 14.w, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 4.w,
        ),
        TextField(
            obscureText: widget.isPassword == true ? obsecureText : false,
            maxLines: widget.maxLines ?? 1,
            keyboardType:
                widget.isNumeric == true ? TextInputType.number : null,
            inputFormatters: widget.isNumeric == true
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  ]
                : null,
            controller: widget.textEditingController,
            decoration: InputDecoration(
                suffixIcon: widget.isPassword == true
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color:
                              obsecureText ? Colors.grey : Colors.red.shade400,
                        ),
                      )
                    : null,
                hintText: 'Masukkan ${widget.title}',
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
