import 'package:e_commapp/cubit/singin/cubit/singin_cubit.dart';
import 'package:e_commapp/features/pages/login_views/Login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'cubit/cubit/serviceproudct_cubit.dart';
import 'cubit/cubit_login/cubit/login_cubit.dart';
import 'cubit/image_cubit/cubit/image_services_cubit.dart';
import 'firebase_options.dart';
import 'observed/bloc_observed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = simple_observe();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<SinginCubit>(
          create: (context) => SinginCubit(),
        ),
        BlocProvider<AddproudctCubit>(
          create: (context) => AddproudctCubit(),
        ),
        BlocProvider<ImageServicesCubit>(
          create: (context) => ImageServicesCubit(),
        ),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: login_view(),
      ),
    );
  }
}
