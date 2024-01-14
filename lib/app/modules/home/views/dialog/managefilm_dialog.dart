import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zamovie/app/data/allmovie_model.dart';
import 'package:zamovie/app/modules/home/controllers/home_controller.dart';
import 'package:zamovie/app/modules/home/views/toast/general_toast.dart';
import 'package:zamovie/app/modules/home/views/widget/generalbutton_widget.dart';
import 'package:zamovie/app/modules/home/views/widget/generaltextfield_dialog.dart';

class ManageFilmDialog extends StatelessWidget {
  final AllMovie? movieData;
  const ManageFilmDialog({super.key, this.movieData});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          width: 1.sw,
          padding: EdgeInsets.fromLTRB(24.w, 0.w, 24.w, 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${movieData == null ? 'Tambah' : 'Edit'} Film',
                  style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8.w,
                ),
                GeneralTextField(
                    title: 'Judul', textEditingController: _.titleController),
                SizedBox(
                  height: 8.w,
                ),
                GeneralTextField(
                    title: 'Sinopsis',
                    textEditingController: _.synopsisController),
                SizedBox(
                  height: 8.w,
                ),
                GeneralTextField(
                    title: 'Genre', textEditingController: _.genreController),
                SizedBox(
                  height: 8.w,
                ),
                GeneralTextField(
                    title: 'Rating', textEditingController: _.ratingController),
                SizedBox(
                  height: 16.w,
                ),
                GeneralButtonWidget(
                    title: 'Simpan',
                    onTap: () {
                      Get.back();
                      GeneralToast()
                          .showSuccessToast(message: 'Berhasil disimpan');
                    }),
                // LoadingButtonWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
