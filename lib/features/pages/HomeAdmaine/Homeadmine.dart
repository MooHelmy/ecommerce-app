import 'package:e_commapp/features/pages/HomeAdmaine/widget/Homeadmine_body.dart';
import 'package:flutter/material.dart';

import '../../../const/constants.dart';

class Homeadmine extends StatelessWidget {
  const Homeadmine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: (Kmaincolor),
      body: Homeadmine_body(),
    );
  }
}
