// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zamovie/app/data/allmovie_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final TextEditingController titleController = TextEditingController();
  final TextEditingController synopsisController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();

  List<AllMovie> allMovie = [
    AllMovie(
      id: 1,
      title: 'The Boy and the Heron',
      synopsis:
          'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
      genre: 'Action',
      rating: 5.0,
      image:
          'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
    ),
    AllMovie(
      id: 2,
      title: 'The Boy and the Heron',
      synopsis:
          'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
      genre: 'Action',
      rating: 4.2,
      image:
          'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
    ),
    AllMovie(
      id: 3,
      title: 'The Boy and the Heron',
      synopsis:
          'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
      genre: 'Action',
      rating: 4.6,
      image:
          'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
    ),
    AllMovie(
      id: 4,
      title: 'The Boy and the Heron',
      synopsis:
          'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
      genre: 'Action',
      rating: 3.0,
      image:
          'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
    ),
    AllMovie(
      id: 5,
      title: 'The Boy and the Heron',
      synopsis:
          'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
      genre: 'Action',
      rating: 2.2,
      image:
          'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
    ),
    AllMovie(
      id: 6,
      title: 'The Boy and the Heron',
      synopsis:
          'Reprehenderit sit Lorem ex enim laboris in ut incididunt. Commodo veniam Lorem irure duis. Pariatur voluptate nulla laboris nostrud enim elit voluptate laborum enim in ad proident. Elit adipisicing reprehenderit sit duis deserunt do et. Eiusmod occaecat deserunt sit aute cupidatat deserunt nulla consequat. Duis nisi est quis ipsum nisi veniam. Et esse eiusmod magna ea nostrud aliqua duis in et.',
      genre: 'Action',
      rating: 5.0,
      image:
          'https://titipjepang.com/wp-content/uploads/2023/10/poster-the-boy-and-the-heron.jpg',
    ),
  ];

  Future deleteMovie({required int id}) async {
    allMovie.removeWhere((element) => element.id == id);
    update();
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
