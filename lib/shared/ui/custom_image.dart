// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:studyhive/shared/ui/spinner.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.fit,
  }) : super(key: key);
  final String imageUrl;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Spinner(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  }
}
