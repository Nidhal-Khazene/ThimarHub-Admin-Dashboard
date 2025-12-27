import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key});

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  late bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: ColorsData.kBorderColor),
      ),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          final ImagePicker picker = ImagePicker();
          final XFile? image = await picker.pickImage(
            source: ImageSource.gallery,
          );
          setState(() {
            isLoading = false;
          });
        },
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Skeletonizer(
                  enabled: isLoading,
                  child: Icon(
                    Icons.image_rounded,
                    size: 180,
                    color: const Color(0xFFC9CECE),
                  ),
                ),
              ),
              Text(
                "Product Image",
                style: AppStyles.regular16.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
