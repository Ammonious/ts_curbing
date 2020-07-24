import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/theme/app_theme.dart';
import 'package:tscurbing/model/service.dart';

@lazySingleton
class LandingViewModel {


	serviceItems({bool isSecond = false}){
	  List<PersistentBottomNavBarItem> items = List();
	  List<PersistentBottomNavBarItem> secondItems = List();
	  if(services != null){
	  	int i = 0;
	    for(ProductService service in services){
	    	if(i < 2){
			    items.add(
					    PersistentBottomNavBarItem(
							    icon: CustomImage(height: 24, width: 24, imagePath: 'assets/curbing_icon.png',),
							    title: service.landingTitle,
							    inactiveColor: nearlyBlack,
							    activeContentColor: AppTheme.themeColor));
		    } else {
	    		secondItems.add(PersistentBottomNavBarItem(
					    icon: CustomImage(height: 24, width: 24, imagePath: 'assets/curbing_icon.png',),
					    title: service.landingTitle,
					    inactiveColor: nearlyBlack,
					    activeContentColor: AppTheme.themeColor));
		    }

	      i++;
      }
    }
	  return isSecond ? secondItems : items;
  }

	List<ProductService> services;
	ProductService serviceAtIndex(int index) =>
		services != null && 	services.length > 0 && services[index] != null ? services[index] :
			ProductService.landingEmpty();

}
