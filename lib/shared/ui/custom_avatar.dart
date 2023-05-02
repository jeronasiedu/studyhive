import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:studyhive/shared/ui/spinner.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
    required this.imageUrl,
    this.width,
    this.radius,
    this.fit,
    this.spinnerSize,
  }) : super(key: key);
  final String imageUrl;
  final double? width;
  final double? radius;
  final BoxFit? fit;
  final SpinnerSize? spinnerSize;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => Spinner(
        size: spinnerSize,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  }
}
