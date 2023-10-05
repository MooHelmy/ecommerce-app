import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../const/constants.dart';
import '../../cubit/cubit_login/cubit/login_cubit.dart';

class Myadmine extends StatefulWidget {
  const Myadmine({super.key});

  @override
  State<Myadmine> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Myadmine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              BlocProvider.of<LoginCubit>(context).isadmine = true;
            });
          },
          child: Text(
            'I\'m admine ',
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 16,
                color: BlocProvider.of<LoginCubit>(context).isadmine
                    ? (Kmaincolor)
                    : Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              BlocProvider.of<LoginCubit>(context).isadmine = false;
            });
          },
          child: Text(
            'I\'m user ',
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 16,
                color: BlocProvider.of<LoginCubit>(context).isadmine
                    ? Colors.white
                    : (Kmaincolor)),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
