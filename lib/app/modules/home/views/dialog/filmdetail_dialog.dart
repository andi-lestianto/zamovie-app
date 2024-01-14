import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zamovie/app/data/allmovie_model.dart';

class FilmDetailDialog extends StatelessWidget {
  final AllMovie movieData;
  const FilmDetailDialog({super.key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kembali'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                            movieData.image,
                          ),
                          opacity: 0.4,
                          fit: BoxFit.cover,
                        )),
                        child: CachedNetworkImage(
                          imageUrl: movieData.image,
                          width: 200.w,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.w,
                    ),
                    Text(
                      movieData.title,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
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
                    SizedBox(
                      height: 4.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.w,
                ),
                Text('Sinopsis :', style: TextStyle(fontSize: 14.sp)),
                SizedBox(
                  height: 4.w,
                ),
                Text(
                  movieData.synopsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
