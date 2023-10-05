import 'package:e_commapp/features/pages/singup/widget/sing_up_body.dart';
import 'package:flutter/material.dart';

class sing_up extends StatelessWidget {
  const sing_up({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFBF30),
      body: sing_up_body(),
    );
  }
}
