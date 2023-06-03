import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width, height;
  final Color? placeholderColor;
  final BoxFit? fit;
  final double borderRadius;
  final bool hasTopBorderRadius;
  final Widget? defaultImg;
  final Color? color;
  final Alignment alignment;
  final Widget? errorWidget;
  final bool orginal;

  const NetworkImage({
    Key? key,
    required this.imageUrl,
    this.errorWidget,
    this.width,
    this.height,
    this.placeholderColor = Colors.grey,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
    this.hasTopBorderRadius = false,
    this.defaultImg,
    this.color,
    this.alignment = Alignment.center,
    this.orginal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((imageUrl ?? '') == '') return _getErrorWidget();

    if (imageUrl!.isNotEmpty) {
      String last = imageUrl!.split('/').last;
      if (last == '0') return _getErrorWidget();
    }
    return CachedNetworkImage(
      color: color,
      colorBlendMode: BlendMode.dst,
      imageUrl: imageUrl ?? '',
      width: width,
      height: height,
      key: UniqueKey(),
      imageBuilder: (context, imageProvider) => orginal
          ? Image(
              alignment: alignment,
              image: imageProvider,
              fit: fit,
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: hasTopBorderRadius
                    ? BorderRadius.only(
                        topLeft: Radius.circular(borderRadius),
                        topRight: Radius.circular(borderRadius),
                      )
                    : BorderRadius.circular(borderRadius),
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit,
                  alignment: alignment,
                ),
              ),
            ),
      placeholder: getPlaceholder,
      errorWidget: (context, url, error) {
        log(error.toString());
        return errorWidget ?? _getErrorWidget();
      },
    );
  }

  Widget _getErrorWidget() => SizedBox(
        width: width,
        height: height,
        child: const Center(
          child: Icon(Icons.image_not_supported_outlined),
        ),
      );

  Widget getPlaceholder(context, url) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.grey.withOpacity(0.6),
      direction: ShimmerDirection.ltr,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: placeholderColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
