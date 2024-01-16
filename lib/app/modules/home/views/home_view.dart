import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:zamovie/app/data/allmovie_model.dart';
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
        body: StreamBuilder(
            stream: _.moviesDBServices.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.none) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error fetching data: ${snapshot.data}');
              } else if (snapshot.hasData &&
                  snapshot.data?.docs.isEmpty == true) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.hourglass_empty_rounded,
                        size: 100.w,
                        color: Colors.red.shade400,
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      Text(
                        'Tidak ada film yang ditambahkan',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                );
              }

              final documents = snapshot.data?.docs;

              final List<AllMovie> movieData =
                  documents!.map((e) => AllMovie.fromJson(e)).toList();

              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot movieSnapshot = snapshot.data!.docs[index];

                    return MovieCardWidget(
                      documentSnapshot: movieSnapshot,
                      movieData: movieData[index],
                      onDelete: () {
                        _.deleteMovie(
                            documentSnapshot: movieSnapshot,
                            movieData: movieData[index]);
                      },
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  FilmDetailDialog(
                            movieData: movieData[index],
                          ),
                        );
                      },
                    );
                  });
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
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
