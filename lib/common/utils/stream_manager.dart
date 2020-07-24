import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/pages/landing_page/model/landing_template.dart';
import 'package:tscurbing/model/service.dart';


  themeStream(ThemeModel themeModel) => StreamProvider.value(
    value: themeModel.stream);


get streamServices  =>
		StreamProvider<List<ProductService>>.value(
				value: Firestore.instance.collection('Services').snapshots().map((snapshot) =>
				List<ProductService>.from(snapshot.documents.toList().map((document) =>
						ProductService.fromJson(document.data)))));

get streamLandingTemplate  =>
		StreamProvider.value(
				value: Firestore.instance.collection('LandingTemplate').document('landing_info')
						.snapshots().map((event) => LandingTemplate.fromJson(event.data)));