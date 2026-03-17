import 'dart:io';

import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/entities/product_entity.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/edit_image_section.dart';
import 'package:flutter/material.dart';

import 'is_featured_field.dart';
import 'is_organic_field.dart';

class EditProductInformationViewBody extends StatefulWidget {
  const EditProductInformationViewBody({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  State<EditProductInformationViewBody> createState() =>
      _EditProductInformationViewBodyState();
}

class _EditProductInformationViewBodyState
    extends State<EditProductInformationViewBody> {
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
              textInputType: TextInputType.text,
              hintText: widget.productEntity.productName,
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              onSaved: (value) {
                productPrice = num.parse(value!);
              },
              textInputType: TextInputType.number,
              hintText: "السعر: ${widget.productEntity.productPrice} دينار ",
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      productCode = value!.toLowerCase();
                    },
                    textInputType: TextInputType.text,
                    hintText: widget.productEntity.productCode,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      expirationsMonth = int.parse(value!);
                    },
                    textInputType: TextInputType.number,
                    hintText: widget.productEntity.expirationsMonth.toString(),
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
                    textInputType: TextInputType.number,
                    hintText: widget.productEntity.unitAmount.toString(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      numberOfCalories = int.parse(value!);
                    },
                    textInputType: TextInputType.number,
                    hintText: widget.productEntity.numberOfCalories.toString(),
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
              hintText: widget.productEntity.productDescription,
              maxLines: 5,
              hintPadding: const EdgeInsets.only(top: 32, right: 20),
            ),
            SizedBox(height: 16),
            IsFeaturedField(
              isChecked: isFeatured,
              onChanged: (value) {
                setState(() {
                  isFeatured = value;
                });
              },
            ),
            SizedBox(height: 8),
            IsOrganicField(
              isChecked: isOrganic,
              onChanged: (value) {
                setState(() {
                  isOrganic = value;
                });
              },
            ),
            SizedBox(height: 8),
            EditImageSection(productEntity: widget.productEntity),
            SizedBox(height: 16),
            CustomButton(
              text: "حفظ البيانات",
              textStyle: AppStyles.bold13.copyWith(color: Colors.white),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "لا ارغب",
              borderColor: ColorsData.kPrimaryColor,
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
