import 'package:e_commapp/app_images.dart';
import 'package:e_commapp/core/widget/custm_text.dart';
import 'package:e_commapp/core/widget/custom_button.dart';
import 'package:e_commapp/cubit/cubit_login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widget/admineOrUser.dart';
import '../../../../cubit/cubit/serviceproudct_cubit.dart';
import '../../HomeAdmaine/Homeadmine.dart';
import '../../singup/sing_up.dart';
import '../../userpage/Homepage.dart';

class login_view_body extends StatefulWidget {
  const login_view_body({super.key});

  @override
  State<login_view_body> createState() => _login_view_bodyState();
}

class _login_view_bodyState extends State<login_view_body> {
  @override
  Widget build(BuildContext context) {
    String? email, password;

    GlobalKey<FormState> formstate = GlobalKey<FormState>();
    SizeConfig().init(context);

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
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginFalierfib) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return state is LoginLoading
                    ? const CircularProgressIndicator()
                    : custom_button(
                        text: 'login',
                        color: Colors.black,
                        onTap: () {
                          if (formstate.currentState!.validate()) {
                            formstate.currentState!.save();
                            BlocProvider.of<LoginCubit>(context)
                                .login(email: email!, password: password!);

                            if (state is LoginSuccess) {
                              BlocProvider.of<AddproudctCubit>(context)
                                  .loadData();
                              BlocProvider.of<LoginCubit>(context).isadmine
                                  ? Get.to(() => const Homeadmine())
                                  : Get.to(() => const Homeuser());
                            }
                          }
                        });
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
                        () => const sing_up(),
                      );
                    },
                    child: const Text('Sing in  ')),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Myadmine(),
          ],
        ),
      ),
    );
  }
}
