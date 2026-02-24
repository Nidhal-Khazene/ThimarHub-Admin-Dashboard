import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextFormField(hintText: "البريد الإلكتروني"),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: "كلمة المرور",
            suffixIcon: Padding(
              padding: EdgeInsets.only(left: 31),
              child: Icon(Iconsax.eye),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'نسيت كلمة المرور؟',
            style: AppStyles.semiBold13.copyWith(
              color: const Color(0xFF2D9F5D),
            ),
          ),
          SizedBox(height: 20),
          CustomButton(text: "تسجيل دخول"),
          SizedBox(height: 37),
          SizedBox(
            width: double.infinity,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'يجب ان يكون لديك حساب مسوؤل من قبل ادارة البرنامج اذا كنت ترغب في تسجيل حساب مسوؤل ؟  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 2.46,
                    ),
                  ),
                  TextSpan(
                    text: 'توصل معنا',
                    style: TextStyle(
                      color: const Color(0xFF1B5E37),
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 2.46,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
