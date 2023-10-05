import 'package:e_commapp/cubit/singin/cubit/singin_cubit.dart';
import 'package:e_commapp/features/pages/login_views/Login_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_images.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widget/custm_text.dart';
import '../../../../core/widget/custom_button.dart';

class sing_up_body extends StatefulWidget {
  const sing_up_body({super.key});

  @override
  State<sing_up_body> createState() => _sing_up_bodyState();
}

class _sing_up_bodyState extends State<sing_up_body> {
  String? email, password, name;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey<FormState>();
    return Form(
      key: formstate,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 15),
              child: SizedBox(
                  height: SizeConfig.defaultSize! * 13,
                  child: Stack(alignment: Alignment.center, children: [
                    Image.asset(Assets.imagesIconsBuyicon),
                    const Positioned(
                      bottom: 0,
                      child: Text(
                        'Buy it',
                        style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                      ),
                    )
                  ])),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 6,
            ),
            custm_text(
                onSaved: (data) {
                  name = data;
                },
                hinttext: 'Enter your name',
                icon: Icons.perm_identity),
            custm_text(
                onSaved: (data) {
                  email = data;
                },
                hinttext: 'Enter your email',
                icon: Icons.email),
            custm_text(
                onSaved: (data) {
                  password = data;
                },
                hinttext: 'Enter your password',
                icon: Icons.lock),
            SizedBox(
              height: SizeConfig.defaultSize! * 3,
            ),
            BlocConsumer<SinginCubit, SinginState>(
              listener: (context, state) {
                if (state is SinginFalierfb) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return custom_button(
                  text: 'Sing in',
                  color: Colors.black,
                  onTap: () {
                    if (formstate.currentState!.validate()) {
                      formstate.currentState!.save();
                      BlocProvider.of<SinginCubit>(context)
                          .singin(email: email!, password: password!);
                      print(email);
                      print(password);
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have account ?  ',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const login_view(),
                      );
                    },
                    child: const Text('Login  ')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
