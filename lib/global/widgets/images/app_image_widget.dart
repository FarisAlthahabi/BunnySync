import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/widgets/images/image_error_covered_widget.dart';
import 'package:bunny_sync/global/widgets/images/themed_placeholder_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  const AppImageWidget({
    super.key,
    required this.url,
    this.borderRadius = BorderRadius.zero,
    this.fit,
    this.width,
    this.height,
    this.border,
    this.imageBuilder,
  });

  final String url;
  final BorderRadiusGeometry borderRadius;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Border? border;
  final ImageWidgetBuilder? imageBuilder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          errorListener: (_) {},
          imageUrl: url,
          fit: fit,
          imageBuilder: imageBuilder,
          placeholder: (_, __) => const ThemedPlaceholderWidget(),
          errorWidget: (_, __, ___) => const ImageErrorCoveredWidget(),
        ),
      ),
    );
  }
}
