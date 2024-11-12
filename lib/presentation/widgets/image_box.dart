import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final String url;
  final BoxFit fit;
  const ImageBox({super.key, required this.url, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, child, loadingProgress) {
        return Center(
            child: CircularProgressIndicator(value: loadingProgress.progress));
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
