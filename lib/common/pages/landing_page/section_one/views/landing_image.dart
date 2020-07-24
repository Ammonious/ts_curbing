import 'package:flutter/material.dart';
import 'package:scheme_package/scheme_package.dart';

class LandingImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final double aspectRatio;
  LandingImage({Key key, this.imageUrl, this.height, this.width, this.aspectRatio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.network(
          imageUrl,
          height: height ?? 400,
          width: width ?? double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
