import 'dart:io';

import 'package:flutter/material.dart';

import '../../const/constants.dart';

class custom_imagee extends StatelessWidget {
  const custom_imagee(
      {super.key, this.image, this.onPressed, this.onPresse_gallery});
  final File? image;
  final Function()? onPressed, onPresse_gallery;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
          onPressed: onPresse_gallery, icon: const Icon(Icons.camera_alt)),
      CircleAvatar(
        backgroundColor: kmainA,
        backgroundImage: image == null ? null : FileImage(image!),
        radius: 80,
      ),
      IconButton(onPressed: onPressed, icon: const Icon(Icons.camera_alt))
    ]);
  }
}
