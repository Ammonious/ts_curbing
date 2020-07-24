import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/pages/landing_page/model/landing_template.dart';

import 'landing_image.dart';

class CarouselView extends StatelessWidget {
	final double height;
	final double width;
CarouselView({Key key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	  final LandingTemplate template = Provider.of(context);

	  if (template == null || template == null) return LoadingView();
    return Material(color:Colors.transparent,child: CarouselSlider.builder(
		    options: CarouselOptions(
				    viewportFraction: 0.9, autoPlay: true, enlargeCenterPage: true),
		    itemCount: template.sliderImages.length,
		    itemBuilder: (context, index) => Container(
			    decoration: BoxDecoration(
					    borderRadius: BorderRadius.circular(16), boxShadow: normalShadow),
			    margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
			    child: LandingImage(
				    imageUrl: template.sliderImages[index],
				    height: height,
				    width: screenWidth(context),
			    ),
		    )),);
  }
}
