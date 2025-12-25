import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../utils/colors_data.dart';

AppBar buildAppBar({required title}) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: ColorsData.kLightPrimaryColor,
    centerTitle: true,
    title: Text(title, style: AppStyles.bold19.copyWith(color: Colors.white)),
  );
}
