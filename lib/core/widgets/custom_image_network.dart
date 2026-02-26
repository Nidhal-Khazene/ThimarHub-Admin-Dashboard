import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({super.key, required this.urlImage});

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      height: 105,
      width: 114,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
            strokeWidth: 2,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
