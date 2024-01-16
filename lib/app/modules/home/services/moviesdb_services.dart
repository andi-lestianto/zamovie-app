import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:zamovie/app/data/allmovie_model.dart';

class MoviesDBServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final Reference dbStorage = FirebaseStorage.instance.ref();

  // get all `user` collection's documents
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsers() {
    return db.collection('movies').snapshots();
  }

  Future<bool> addMovie({required Map<String, dynamic> data}) async {
    try {
      await db.collection('movies').add(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateMovie(
      {required DocumentSnapshot documentSnapshot,
      required Map<String, dynamic> data,
      required AllMovie movieData}) async {
    if (data['image'] != null) {
      final storageRef = dbStorage.child(movieData.image!
          .split('/')
          .last
          .replaceAll('%2F', '/')
          .split('?')
          .first);
      await storageRef.delete();
    }
    try {
      await db.collection('movies').doc(documentSnapshot.id).update(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteMovie(
      {required DocumentSnapshot documentSnapshot,
      required AllMovie movieData}) async {
    try {
      final storageRef = dbStorage.child(movieData.image!
          .split('/')
          .last
          .replaceAll('%2F', '/')
          .split('?')
          .first);
      await storageRef.delete();
      await db.collection('movies').doc(documentSnapshot.id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> uploadImageToFirebase({required File pickedFoto}) async {
    var imageName = DateTime.now().millisecondsSinceEpoch.toString();
    var storageRef =
        FirebaseStorage.instance.ref().child('movie_image/$imageName.jpg');
    var uploadTask = storageRef.putFile(pickedFoto);
    var downloadUrl = await (await uploadTask).ref.getDownloadURL();

    return downloadUrl;
  }
}
