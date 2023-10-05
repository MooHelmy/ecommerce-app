import 'package:e_commapp/core/widget/custom_button.dart';
import 'package:e_commapp/cubit/cubit/serviceproudct_cubit.dart';
import 'package:e_commapp/features/pages/service/Edit_updateproudct/edit_proudct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../service/add Prouduct/Add Prouduct.dart';

class Homeadmine_body extends StatefulWidget {
  const Homeadmine_body({super.key});

  @override
  State<Homeadmine_body> createState() => _Homeadmine_bodyState();
}

class _Homeadmine_bodyState extends State<Homeadmine_body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          custom_button(
            text: 'Add Prouduct',
            color: Colors.blueAccent.withOpacity(.5),
            onTap: () {
              Get.to(
                () => add_Prouduct(),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          custom_button(
            text: 'Edit Prouduct',
            color: Colors.blueAccent.withOpacity(.5),
            onTap: () {
              BlocProvider.of<AddproudctCubit>(context).loadData();
              Get.to(
                () => edit_proudct(),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          custom_button(
              text: 'View Prouduct', color: Colors.blueAccent.withOpacity(.5)),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
