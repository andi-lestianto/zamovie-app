import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zamovie/app/data/allmovie_model.dart';

class MovieCardWidget extends StatelessWidget {
  final AllMovie movieData;
  final Function onDelete;
  final Function onTap;
  const MovieCardWidget(
      {super.key,
      required this.movieData,
      required this.onDelete,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.horizontal,
      key: Key(movieData.id.toString()),
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
          log('Ubah Data');
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
                width: 100.w,
                imageUrl: movieData.image,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieData.title,
                      style: TextStyle(
                          fontSize: 20.w, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4.w),
                    Text(
                      movieData.synopsis,
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
                        movieData.genre,
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
                                  color: index < movieData.rating.round()
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
