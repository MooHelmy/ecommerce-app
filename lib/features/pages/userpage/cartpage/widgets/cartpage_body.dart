import 'package:e_commapp/Data/models/proudct_model.dart';
import 'package:e_commapp/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class cartpage_body extends StatelessWidget {
  const cartpage_body({super.key});

  @override
  Widget build(BuildContext context) {
    proudct_model proudect =
        ModalRoute.of(context)!.settings.arguments as proudct_model;
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset(proudect.location),
              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),
              Text('name : ${proudect.name}'),
              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),
              Text('price : ${proudect.price}'),
            ],
          ),
        ),
      ),
    );
  }
}
