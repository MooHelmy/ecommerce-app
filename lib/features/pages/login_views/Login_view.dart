import 'package:e_commapp/features/pages/login_views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class login_view extends StatelessWidget {
  const login_view({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFBF30),
      body: login_view_body(),
    );
  }
}
