import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/pages/landing_page/model/landing_template.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/model/service.dart';

class SlidingCardsView extends StatefulWidget {
	final double height;
  const SlidingCardsView({Key key, this.height}) : super(key: key);
	@override
	_SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
	SwiperController pageController;
	double pageOffset = 0;
	double get height => widget.height;
	@override
	void initState() {
		super.initState();
		pageController = SwiperController();
		pageController.addListener(() {
		//	setState(() => pageOffset = pageController.page);
		});
	}

	@override
	void dispose() {
		pageController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		final LandingTemplate template = Provider.of(context);
		if(template == null) return LoadingView(height: height ?? h * .55,color: theme.themeColor);
		return SizedBox(
			height: height ?? h * .55,
			child: Swiper(
				controller: pageController,
				itemCount: template.sliderImages.length,
				itemBuilder: (context,index) => SizedBox(height: height ?? h * .55,
				  child: SlidingCard(
					  height: height ?? h * .55,
				  imageUrl: template.sliderImages[index],
				  offset: pageOffset - index,
			),
				),
			),
		);
	}
}

class SlidingCard extends StatelessWidget {
	final String imageUrl;
	final double offset;
	final double height;
	const SlidingCard({
		                  Key key,
		                  @required this.imageUrl,
		                  @required this.offset, this.height,
	                  }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
		return Transform.translate(
			offset: Offset(-32 * gauss * offset.sign, 0),
			child: Card(
				color: theme.barColor,
				margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
				elevation: 8,
				clipBehavior: Clip.antiAlias,
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
				child: 	ClipRRect(
					borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
					child: Image.network(
						imageUrl,
						height: height ?? h * 0.55,
						alignment: Alignment(-offset.abs(), 0),
						fit: BoxFit.cover,
					),
				),
			),
		);
	}
}

