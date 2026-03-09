import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final int memCacheWidth;
  final int memCacheHeight;
  const NetworkImageWidget({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    required this.memCacheWidth,
    required this.memCacheHeight,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: BoxFit.fill,
      memCacheHeight: memCacheHeight,
      memCacheWidth: memCacheWidth,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
