import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/core/services/get_it_service.dart';
import 'package:ecommerce_app_dashboard/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommerce_app_dashboard/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/sign_in_cubit/sign_in_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "تسجيل الدخول",
        leading: SizedBox(),
        context: context,
      ),
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: BlocProvider(
            create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
            child: LoginViewBody(),
          ),
        ),
      ),
    );
  }
}
