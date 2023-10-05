import 'package:e_commapp/Data/models/proudct_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/pages/userpage/cartpage/cartpage.dart';
import '../utils/size_config.dart';
import 'custom_item.dart';

class custmGrid extends StatelessWidget {
  const custmGrid({super.key, required this.lis_proudct});
  final List<proudct_model> lis_proudct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
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
            ontap: () {
              Get.to(() => cartpage(), arguments: lis_proudct[index]);
            },
          );
        },
      ),
    );
  }
}
