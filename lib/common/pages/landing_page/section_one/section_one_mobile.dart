import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/api/quickbooks_api.dart';
import 'package:tscurbing/common/utils/constants.dart';
import 'package:tscurbing/common/pages/landing_page/section_one/views/carousel_view.dart';
import 'package:tscurbing/common/widgets/parallax_slider.dart';
import 'package:tscurbing/model/service.dart';
import 'package:tscurbing/common/locator/locator.dart';
import '../model/landing_view_model.dart';

class SectionOneMobile extends HookWidget {
  final LandingViewModel model = locator<LandingViewModel>();
  SectionOneMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    final List<ProductService> services = Provider.of(context);
    model.services = services;
    ProductService service = model.serviceAtIndex(selectedIndex.value);

    return Material(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          SlidingCardsView(),
          SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}
