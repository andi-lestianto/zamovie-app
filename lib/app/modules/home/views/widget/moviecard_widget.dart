import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zamovie/app/data/allmovie_model.dart';
import 'package:zamovie/app/modules/home/views/dialog/managefilm_dialog.dart';

class MovieCardWidget extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  final AllMovie movieData;
  final Function onDelete;
  final Function onTap;
  const MovieCardWidget(
      {super.key,
      required this.movieData,
      required this.onDelete,
      required this.onTap,
      required this.documentSnapshot});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.horizontal,
      key: Key(documentSnapshot.id),
      background: Container(
        decoration: const BoxDecoration(color: Colors.blue),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.edit, color: Colors.white),
                SizedBox(height: 8.w),
                Text(
                  'Edit Data',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ),
      ),
      secondaryBackground: Container(
        decoration: BoxDecoration(color: Colors.red.shade400),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.delete, color: Colors.white),
                SizedBox(height: 8.w),
                Text(
                  'Hapus Data',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.endToStart) {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  'Konfirmasi',
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                ),
                content: Text(
                  'Yakin ingin mengapus data',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
                actions: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.red.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          )),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        onDelete();
                      },
                      child: const Text('Hapus',
                          style: TextStyle(color: Colors.white))),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        )),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Batal',
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              );
            },
          );
        }
        if (direction == DismissDirection.startToEnd) {
          showModalBottomSheet(
              showDragHandle: true,
              backgroundColor: Colors.white,
              isScrollControlled: true,
              enableDrag: true,
              context: context,
              builder: (context) => ManageFilmDialog(
                    movieData: movieData,
                    documentSnapshot: documentSnapshot,
                  ));
        }
        return null;
      },
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CachedNetworkImage(
                width: 90.w,
                height: 140.w,
                imageUrl: movieData.image.toString(),
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieData.title.toString(),
                      style: TextStyle(
                          fontSize: 20.w, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4.w),
                    Text(
                      movieData.sinopsis.toString(),
                      style: TextStyle(
                          fontSize: 12.w, fontWeight: FontWeight.normal),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.w),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.w),
                      decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Text(
                        movieData.genre.toString(),
                        style: TextStyle(
                            fontSize: 12.w,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 4.w),
                    Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: index < movieData.rating!.round()
                                      ? Colors.orange
                                      : Colors.grey.shade300,
                                )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
