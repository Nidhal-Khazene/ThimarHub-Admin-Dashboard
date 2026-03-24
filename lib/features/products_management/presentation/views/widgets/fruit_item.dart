import 'dart:developer';

import 'package:ecommerce_app_dashboard/core/helper/show_false_snack_bar.dart';
import 'package:ecommerce_app_dashboard/core/helper/show_true_snack_bar.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/edit_product_information_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/colors_data.dart';
import '../../../../../core/widgets/custom_image_network.dart';
import '../../../domain/entities/product_entity.dart';
import '../../manager/cubits/remove_product_cubit/remove_product_cubit.dart';

class FruitItem extends StatefulWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  State<FruitItem> createState() => _FruitItemState();
}

class _FruitItemState extends State<FruitItem> {
  @override
  Widget build(BuildContext context) {
    log(widget.productEntity.productCode);
    log(widget.productEntity.imagePath ?? "null");

    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 17),
                widget.productEntity.urlImage != null
                    ? Flexible(
                        child: GestureDetector(
                          onTap: () async {
                            final result = await Navigator.pushNamed(
                              context,
                              EditProductInformationView.routeName,
                              arguments: widget.productEntity,
                            );

                            if (result == true) {
                              setState(() {});
                            }
                          },
                          child: CustomImageNetwork(
                            urlImage:
                                "${widget.productEntity.urlImage!}?v=${DateTime.now().millisecondsSinceEpoch}",
                          ),
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
                    widget.productEntity.productName,
                    style: AppStyles.semiBold13,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${widget.productEntity.productPrice}دينار ',
                          style: AppStyles.bold13.copyWith(
                            color: ColorsData.kSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/ الكيلو',
                          style: AppStyles.semiBold13.copyWith(
                            color: ColorsData.kLightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            child: BlocConsumer<RemoveProductCubit, RemoveProductState>(
              builder: (context, state) {
                if (state is RemoveProductLoading) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: ColorsData.kLightPrimaryColor,
                        strokeWidth: 2,
                      ),
                    ),
                  );
                }
                return IconButton(
                  onPressed: () {
                    context.read<RemoveProductCubit>().removeProduct(
                      productCode: widget.productEntity.productCode,
                      imagePath: widget.productEntity.imagePath!,
                    );
                  },
                  icon: const Icon(
                    Iconsax.trash,
                    color: Colors.redAccent,
                    size: 24,
                  ),
                );
              },
              listener: (context, state) {
                if (state is RemoveProductSuccess) {
                  showTrueSnackBar(
                    context,
                    message: "نجاح حذف المنتج",
                    secondsDuration: 2,
                  );
                }
                if (state is RemoveProductFailure) {
                  showFalseSnackBar(
                    context,
                    errorMessage: "فشل حذف المنتج",
                    secondsDuration: 2,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
