import 'dart:io';

import 'package:e_commapp/const/constants.dart';
import 'package:e_commapp/core/utils/size_config.dart';
import 'package:e_commapp/core/widget/custom_button.dart';
import 'package:e_commapp/core/widget/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Data/models/proudct_model.dart';
import '../../../../core/widget/custm_text.dart';
import '../../../../cubit/cubit/serviceproudct_cubit.dart';
import '../../../../cubit/image_cubit/cubit/image_services_cubit.dart';

class add_Prouduct_body extends StatefulWidget {
  const add_Prouduct_body({
    super.key,
  });

  @override
  State<add_Prouduct_body> createState() => _add_Prouduct_bodyState();
}

class _add_Prouduct_bodyState extends State<add_Prouduct_body> {
  File? image;
  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicke = ImagePicker();

    String? name, price, description, category, location;
    GlobalKey<FormState> formstate = GlobalKey();

    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 20),
      child: Form(
        key: formstate,
        child: SingleChildScrollView(
          child: Column(
            children: [
              custm_text(
                hinttext: 'proudct name',
                onSaved: (data) {
                  name = data;
                },
              ),
              custm_text(
                hinttext: 'proudct price',
                onSaved: (data) {
                  price = data;
                },
              ),
              custm_text(
                hinttext: 'proudct description',
                onSaved: (data) {
                  description = data;
                },
              ),
              custm_text(
                hinttext: 'proudct category',
                onSaved: (data) {
                  category = data;
                },
              ),
              custom_imagee(
                  image: image,
                  onPressed: () async {
                    var imagep =
                        await imagePicke.pickImage(source: ImageSource.camera);
                    setState(() {
                      imagep == null ? image = null : image = File(imagep.path);
                    });
                  },
                  onPresse_gallery: () async {
                    var imagep =
                        await imagePicke.pickImage(source: ImageSource.gallery);
                    setState(() {
                      imagep == null ? image = null : image = File(imagep.path);
                    });
                    if (image != null) {
                      BlocProvider.of<ImageServicesCubit>(context)
                          .uploadeImage(file: image!);
                    }
                  }),
              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),
              BlocListener<ImageServicesCubit, ImageServicesState>(
                listener: (context, state) {
                  BlocProvider.of<ImageServicesCubit>(context)
                      .uploadeImage(file: image!);
                  if (state is ImageServicessuccess) {
                    location = state.url;
                  }
                },
                child: custom_button(
                  text: 'ADD',
                  color: Colors.amberAccent,
                  onTap: () {
                    if (formstate.currentState!.validate()) {
                      formstate.currentState!.save();
                      proudct_model model = proudct_model(
                          name: name!,
                          price: price!,
                          description: description!,
                          category: category!,
                          location: location!);
                      BlocProvider.of<AddproudctCubit>(context)
                          .addproudct(model: model);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
