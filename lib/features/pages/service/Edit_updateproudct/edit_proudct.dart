import 'package:e_commapp/core/utils/size_config.dart';
import 'package:e_commapp/features/pages/service/Edit_updateproudct/widget/edit_proudct_body.dart';
import 'package:flutter/material.dart';

class edit_proudct extends StatelessWidget {
  const edit_proudct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.defaultSize! * 10, left: 5, right: 5),
        child: Container(
            height: SizeConfig.screenHeight!,
            decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )),
            child: const edit_proudct_body()),
      ),
    );
  }
}
