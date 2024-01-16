// ignore_for_file: unnecessary_overrides

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zamovie/app/data/allmovie_model.dart';
import 'package:zamovie/app/modules/home/services/moviesdb_services.dart';
import 'package:zamovie/app/modules/home/views/toast/general_toast.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final TextEditingController titleController = TextEditingController();
  final TextEditingController synopsisController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();

  MoviesDBServices moviesDBServices = MoviesDBServices();

  // List<AllMovie> allMovie = [
  //   AllMovie(
  //     id: 1,
  //     title: 'The Boy and the Heron',
  //     synopsis:
  //         'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
  //     genre: 'Action',
  //     rating: 5.0,
  //     image:
  //         'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
  //   ),
  //   AllMovie(
  //     id: 2,
  //     title: 'The Boy and the Heron',
  //     synopsis:
  //         'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
  //     genre: 'Action',
  //     rating: 4.2,
  //     image:
  //         'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
  //   ),
  //   AllMovie(
  //     id: 3,
  //     title: 'The Boy and the Heron',
  //     synopsis:
  //         'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
  //     genre: 'Action',
  //     rating: 4.6,
  //     image:
  //         'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
  //   ),
  //   AllMovie(
  //     id: 4,
  //     title: 'The Boy and the Heron',
  //     synopsis:
  //         'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
  //     genre: 'Action',
  //     rating: 3.0,
  //     image:
  //         'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
  //   ),
  //   AllMovie(
  //     id: 5,
  //     title: 'The Boy and the Heron',
  //     synopsis:
  //         'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
  //     genre: 'Action',
  //     rating: 2.2,
  //     image:
  //         'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
  //   ),
  //   AllMovie(
  //     id: 6,
  //     title: 'The Boy and the Heron',
  //     synopsis:
  //         'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
  //     genre: 'Action',
  //     rating: 5.0,
  //     image:
  //         'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
  //   ),
  // ];

  Future deleteMovie(
      {required DocumentSnapshot documentSnapshot,
      required AllMovie movieData}) async {
    final isSuccess = await moviesDBServices.deleteMovie(
        documentSnapshot: documentSnapshot, movieData: movieData);
    if (isSuccess) {
      GeneralToast().showSuccessToast(message: 'Data berhasil dihapus!');
    } else {
      GeneralToast().showAlertToast(message: 'Data gagal dihapus!');
    }
  }

  File? pickedFoto;
  final ImagePicker picker = ImagePicker();

  pickFotoProfile() async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        pickedFoto = File(pickedFile.path);
      }
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  clearFormDialog() async {
    titleController.clear();
    synopsisController.clear();
    genreController.clear();
    ratingController.clear();
    pickedFoto = null;
    await Future.delayed(const Duration(milliseconds: 100))
        .then((value) => update());
  }

  fillFormDialog({required AllMovie movieData}) async {
    titleController.text = movieData.title!;
    synopsisController.text = movieData.sinopsis!;
    genreController.text = movieData.genre!;
    ratingController.text = movieData.rating!.toString();
  }

  Future addMovies() async {
    if (titleController.text == '' ||
        synopsisController.text == '' ||
        genreController.text == '' ||
        ratingController.text == '' ||
        pickedFoto == null) {
      GeneralToast().showAlertToast(message: 'Semua Data Harus Diisi');
    } else {
      Map<String, dynamic> data = {
        'title': titleController.text,
        'sinopsis': synopsisController.text,
        'genre': genreController.text,
        'rating': double.parse(ratingController.text) > 5
            ? 5.0
            : double.parse(ratingController.text),
        'image': await moviesDBServices.uploadImageToFirebase(
            pickedFoto: pickedFoto!),
      };

      final isSuccess = await moviesDBServices.addMovie(data: data);
      if (isSuccess) {
        Get.back();
        GeneralToast().showSuccessToast(message: 'Sukses Menambahkan Film');
      } else {
        GeneralToast().showAlertToast(message: 'Gagal Menambahkan Film');
      }
    }
  }

  Future updateMovie(
      {required DocumentSnapshot documentSnapshot,
      required AllMovie movieData}) async {
    if (titleController.text == '' ||
        synopsisController.text == '' ||
        genreController.text == '' ||
        ratingController.text == '') {
      GeneralToast().showAlertToast(message: 'Semua Data Harus Diisi');
    } else {
      Map<String, dynamic> data = {
        'title': titleController.text,
        'sinopsis': synopsisController.text,
        'genre': genreController.text,
        'rating': double.parse(ratingController.text) > 5
            ? 5.0
            : double.parse(ratingController.text),
      };

      if (pickedFoto != null) {
        data['image'] = await moviesDBServices.uploadImageToFirebase(
            pickedFoto: pickedFoto!);
      }

      final isSuccess = await moviesDBServices.updateMovie(
          documentSnapshot: documentSnapshot, data: data, movieData: movieData);
      if (isSuccess) {
        Get.back();
        GeneralToast().showSuccessToast(message: 'Sukses Edit Data Film');
      } else {
        GeneralToast().showAlertToast(message: 'Gagal Edit Data Film');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
