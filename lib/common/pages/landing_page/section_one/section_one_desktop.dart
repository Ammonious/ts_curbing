import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/pages/landing_page/model/landing_template.dart';
import 'package:tscurbing/common/pages/landing_page/section_one/views/landing_image.dart';
import 'package:tscurbing/common/pages/landing_page/section_one/views/service_card.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/model/service.dart';
import 'package:tscurbing/common/locator/locator.dart';

import '../model/landing_view_model.dart';

class SectionOneDesktop extends HookWidget {
  final LandingViewModel model = locator<LandingViewModel>();
  SectionOneDesktop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);
    final List<ProductService> services = Provider.of(context);
    final LandingTemplate template = Provider.of(context);

    if (template == null || services == null) return LoadingView();
    model.services = services;

    ProductService service = model.serviceAtIndex(selectedIndex.value);

    return Material(
      color: Colors.transparent,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * .75,
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomImage(
                          height: 300,
                          width: screenWidth(context) * .3,
                          imagePath: AppTheme.logoStack,
                        ),
                        SizedBox(
                          height: 48,
                        ),
                        AutoSizeText(
                          'Request Quote',
                          maxLines: 1,
                          style: GoogleFonts.candal(fontSize: 52, color: AppTheme.nearlyBlack),
                        ),
                        SizedBox(height: 24),
                        Wrap(
                          spacing: 24,
                          runSpacing: 16,
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            SchemeButton(
                              gradient: AppTheme.darkThemeGradient,
                              label: 'Commercial',
                              height: 62,
                              width: 160,
                              decoration: SchemeButtonDecoration(superEllipseShape: true,borderRadius: BorderRadius.circular(42),boxShadow: liftedShadow),

                              textStyle: theme.button_gradient,
                            ),
                            SchemeButton(buttonStyle: SchemeButtonStyle.gradient,
                              gradient: AppTheme.themeGradient,
                              label: 'Resedential',
                              height: 62,
                              width: 160,
                              decoration: SchemeButtonDecoration(superEllipseShape: true,borderRadius: BorderRadius.circular(42),boxShadow: liftedShadow),
                              textStyle: theme.button_gradient,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Swiper(
                      autoplayDelay: 3000,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) => LandingImage(
                        imageUrl: template.sliderImages[index],
                        width: screenWidth(context) * .6,
                        height: screenHeight * .55,
                      ),
                      itemCount: template.sliderImages.length,
                      itemWidth: screenWidth(context) * .6,
                      itemHeight: screenHeight * .55,
                      layout: SwiperLayout.TINDER,
                    ),
                  ),
                  SizedBox(width: 24)
                ],
              ),
            ),
            Container(
                width: screenWidth(context),
                padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            template.mainValuePropTitle,
                            maxLines: 1,
                            style: GoogleFonts.candal(fontSize: 62),
                          ),
                          AutoSizeText(
                            template.mainValuePropBody,
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w200,
                                color: nearlyBlack,
                                fontSize: 24,
                                height: 1.25),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    Flexible(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: screenHeight * .12,
                              child: ListView.builder(
                                  itemCount: services.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: ServiceCard(
                                          onSelect: () => selectedIndex.value = index,
                                          selected: selectedIndex.value == index,
                                          title: model.serviceAtIndex(index).landingTitle,
                                          imagePath: model.serviceAtIndex(index).landingImageUrl,
                                        ),
                                      )),
                            ),
                          ),
                          CustomDivider(
                            verticalPadding: 24,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            child: Wrap(
                              spacing: 32,
                              runSpacing: 24,
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: liftedShadow),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      service.landingImageUrl,
                                      width: 300,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (screenWidth(context) * .45) - 324,
                                  constraints: BoxConstraints(
                                    minWidth: 400,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        service.landingTitle,
                                        style: GoogleFonts.monda(fontSize: 42),
                                      ),
                                      Container(
                                        height: 6,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            gradient: AppTheme.themeGradient),
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        service.landingBody,
                                        style: GoogleFonts.raleway(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
