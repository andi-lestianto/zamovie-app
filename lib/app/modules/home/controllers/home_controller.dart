// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:zamovie/app/data/allmovie_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  List<AllMovie> allMovie = [
    AllMovie(
      id: 1,
      title: 'Avengers',
      genre: 'Action',
      rating: 5.0,
      image: 'assets/images/avengers.jpg',
    )
  ];

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
