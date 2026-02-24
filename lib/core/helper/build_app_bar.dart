import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../utils/colors_data.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: AppStyles.bold19.copyWith(
      fontFamily: "Cairo",
      color: ColorsData.kFontPrimaryColor,
    ),
  );
}
