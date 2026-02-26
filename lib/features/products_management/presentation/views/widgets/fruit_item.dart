import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/cart/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../entities/product_entity.dart';
import 'custom_image_network.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.heart_copy,
                color: Color(0xFF292D32),
                size: 16,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 17),
                productEntity.urlImage != null
                    ? Flexible(
                        child: CustomImageNetwork(
                          urlImage: productEntity.urlImage!,
                        ),
                      )
                    : Flexible(
                        child: Container(
                          color: Colors.grey,
                          height: 105,
                          width: 114,
                        ),
                      ),
                const SizedBox(height: 24),
                ListTile(
                  title: Text(
                    productEntity.productName,
                    style: AppStyles.semiBold13,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.productPrice}دينار ',
                          style: AppStyles.bold13.copyWith(
                            color: ColorData.kSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/ الكيلو',
                          style: AppStyles.semiBold13.copyWith(
                            color: ColorData.kLightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addProductEntity(productEntity);
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: ShapeDecoration(
                        color: ColorData.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Center(
                        child: Icon(Iconsax.add_copy, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
