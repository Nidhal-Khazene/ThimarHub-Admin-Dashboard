import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddNewProductViewBody extends StatelessWidget {
  const AddNewProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormField(hintText: "اسم الصنف"),
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
              Expanded(child: CustomTextFormField(hintText: "السعر")),
              const SizedBox(width: 16),
              Expanded(child: CustomTextFormField(hintText: "خصم%")),
            ],
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: "تفاصيل عنه",
            maxLines: 5,
            hintPadding: const EdgeInsets.only(top: 32, right: 20),
          ),
        ],
      ),
    );
  }
}
