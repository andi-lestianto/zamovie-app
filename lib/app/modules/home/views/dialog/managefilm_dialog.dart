import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zamovie/app/data/allmovie_model.dart';
import 'package:zamovie/app/modules/home/controllers/home_controller.dart';
import 'package:zamovie/app/modules/home/views/widget/generalbutton_widget.dart';
import 'package:zamovie/app/modules/home/views/widget/generaltextfield_dialog.dart';

class ManageFilmDialog extends StatelessWidget {
  final DocumentSnapshot? documentSnapshot;
  final AllMovie? movieData;
  const ManageFilmDialog({super.key, this.movieData, this.documentSnapshot});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        final HomeController controller = Get.find<HomeController>();
        controller.clearFormDialog();
        if (movieData != null) {
          controller.fillFormDialog(movieData: movieData!);
        }
      },
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
                  textEditingController: _.synopsisController,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 8.w,
                ),
                GeneralTextField(
                    title: 'Genre', textEditingController: _.genreController),
                SizedBox(
                  height: 8.w,
                ),
                GeneralTextField(
                  title: 'Rating (0 - 5)',
                  textEditingController: _.ratingController,
                  isNumeric: true,
                ),
                SizedBox(
                  height: 8.w,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gambar',
                      style: TextStyle(
                          fontSize: 14.w, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    GeneralButtonWidget(
                      title: movieData != null && _.pickedFoto == null
                          ? movieData!.image!.split('%2F').last.split('?').first
                          : _.pickedFoto == null
                              ? 'Pilih gambar'
                              : _.pickedFoto!.path.split('/').last,
                      onTap: () {
                        _.pickFotoProfile();
                      },
                      isSecondary: true,
                      icon: Icon(
                        Icons.image,
                        color: Colors.red.shade400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.w,
                ),
                GeneralButtonWidget(
                    title: 'Simpan',
                    onTap: () {
                      if (movieData != null) {
                        _.updateMovie(
                            documentSnapshot: documentSnapshot!,
                            movieData: movieData!);
                      } else {
                        _.addMovies();
                      }
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
