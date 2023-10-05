import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

part 'image_services_state.dart';

class ImageServicesCubit extends Cubit<ImageServicesState> {
  ImageServicesCubit() : super(ImageServicesInitial());
  uploadeImage({required File file}) async {
    Reference storage =
        FirebaseStorage.instance.ref().child(basename(file.path));
    UploadTask uploadTask = storage.putFile(file);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    String url = await snapshot.ref.getDownloadURL();
    emit(ImageServicessuccess(url: url));
    print('url is = $url');
    print('done');
  }
}
