import 'package:e_commapp/Data/models/proudct_model.dart';
import 'package:e_commapp/core/utils/size_config.dart';
import 'package:e_commapp/core/widget/custom_item.dart';
import 'package:e_commapp/cubit/cubit/serviceproudct_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../update.dart';

class edit_proudct_body extends StatelessWidget {
  const edit_proudct_body({super.key, this.ontap});
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    List<proudct_model> lis_proudct = [];

    return BlocConsumer<AddproudctCubit, AddproudctState>(
      listener: (BuildContext context, state) {
        if (state is Addproudcsuccess) {
          lis_proudct = state.prodctlist;
        }
      },
      builder: (BuildContext context, Object? state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: GridView.builder(
            itemCount: lis_proudct.length,
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: SizeConfig.defaultSize! * 6),
            itemBuilder: (context, index) {
              return custom_item(
                proudctmo: lis_proudct[index],
                icon: Icons.delete,
                onpressed: () {
                  BlocProvider.of<AddproudctCubit>(context)
                      .deletDoc(lis_proudct[index].DocId);
                  BlocProvider.of<AddproudctCubit>(context).loadData();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('item delete ')));
                },
                ontap: () {
                  Get.to(() => update(), arguments: lis_proudct[index]);
                },
              );
            },
          ),
        );
      },
    );
  }
}
