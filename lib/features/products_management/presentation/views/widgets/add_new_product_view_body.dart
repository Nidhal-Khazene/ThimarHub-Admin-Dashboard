import 'dart:io';

import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/add_image_section.dart';
import 'package:flutter/material.dart';

import '../../../../add_product/presentation/views/widgets/is_featured_field.dart';
import '../../../../add_product/presentation/views/widgets/is_organic_field.dart';

class AddNewProductViewBody extends StatefulWidget {
  const AddNewProductViewBody({super.key});

  @override
  State<AddNewProductViewBody> createState() => _AddNewProductViewBodyState();
}

class _AddNewProductViewBodyState extends State<AddNewProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String productName, productCode, productDescription;
  late num productPrice;
  File? fileImage;
  bool isFeatured = false;
  bool isOrganic = false;
  late int expirationsMonth, numberOfCalories, unitAmount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            CustomTextFormField(
              onSaved: (value) {
                productName = value!;
              },
              hintText: "اسم الصنف",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              onSaved: (value) {
                productPrice = num.parse(value!);
              },
              hintText: "سعر الصنف",
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      productCode = value!.toLowerCase();
                    },
                    hintText: "رمز الصنف",
                    textInputType: TextInputType.text,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      expirationsMonth = int.parse(value!);
                    },
                    hintText: "مدة الصلاحية بالأشهر",
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      unitAmount = int.parse(value!);
                    },
                    hintText: "الكمية للسعرات (كغ)",
                    textInputType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      numberOfCalories = int.parse(value!);
                    },
                    hintText: "عدد السعرات الحرارية",
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (value) {
                productDescription = value!;
              },
              textInputType: TextInputType.text,
              hintText: "تفاصيل عنه",
              maxLines: 5,
              hintPadding: const EdgeInsets.only(top: 32, right: 20),
            ),
            SizedBox(height: 16),
            IsFeaturedField(
              onChanged: (value) {
                isFeatured = value;
              },
            ),
            SizedBox(height: 16),
            IsOrganicField(
              onChanged: (value) {
                isOrganic = value;
              },
            ),
            SizedBox(height: 16),
            AddImageSection(),
            SizedBox(height: 48),
            CustomButton(
              text: "حفظ البيانات",
              textStyle: AppStyles.bold13.copyWith(color: Colors.white),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "لا ارغب",
              backgroundColor: Colors.transparent,
              textStyle: AppStyles.bold13.copyWith(
                color: ColorsData.kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
