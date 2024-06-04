import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

abstract class ImagesUtils {
  static ImageWidgetBuilder imageHeroBuilder(String tag, {BoxFit? fit}) {
    return (_, imageProvider) => Hero(
          tag: tag,
          child: Image(
            image: imageProvider,
            fit: fit,
          ),
        );
  }
}
