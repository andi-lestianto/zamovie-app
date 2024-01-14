import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:zamovie/app/modules/home/views/dialog/filmdetail_dialog.dart';
import 'package:zamovie/app/modules/home/views/dialog/managefilm_dialog.dart';
import 'package:zamovie/app/modules/home/views/widget/moviecard_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Film Bioskop'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: _.allMovie.length,
            itemBuilder: (context, index) {
              return MovieCardWidget(
                movieData: _.allMovie[index],
                onDelete: () {
                  _.deleteMovie(id: _.allMovie[index].id);
                },
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FilmDetailDialog(
                      movieData: _.allMovie[index],
                    ),
                  );
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red.shade400,
          onPressed: () {
            showModalBottomSheet(
                showDragHandle: true,
                backgroundColor: Colors.white,
                isScrollControlled: true,
                enableDrag: true,
                context: context,
                builder: (context) => const ManageFilmDialog());
          },
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 32.w,
          ),
        ),
      );
    });
  }
}
