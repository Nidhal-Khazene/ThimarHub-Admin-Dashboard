import 'package:ecommerce_app_dashboard/constants.dart';
import 'package:ecommerce_app_dashboard/core/helper/build_app_bar.dart';
import 'package:ecommerce_app_dashboard/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "تسجيل الدخول", context: context),
      body: SafeArea(
        child: Padding(padding: kPrimaryScreenPadding, child: LoginViewBody()),
      ),
    );
  }
}
