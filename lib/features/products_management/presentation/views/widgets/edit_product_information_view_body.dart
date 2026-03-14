import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/add_image_section.dart';
import 'package:flutter/material.dart';

class EditProductInformationViewBody extends StatelessWidget {
  const EditProductInformationViewBody({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormField(hintText: productEntity.productName),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: CustomTextFormField(hintText: "تاريخ الانتاج")),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(hintText: "تاريخ انتهاء الصلاحيه"),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: "السعر: ${productEntity.productPrice} دينار ",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(child: CustomTextFormField(hintText: "خصم%")),
            ],
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: productEntity.productDescription,
            maxLines: 5,
            hintPadding: const EdgeInsets.only(top: 32, right: 20),
          ),
          SizedBox(height: 32),
          AddImageSection(productEntity: productEntity),
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
    );
  }
}
