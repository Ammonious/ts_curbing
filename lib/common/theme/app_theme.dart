import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheme_package/scheme_package.dart';
import 'package:tscurbing/common/locator/locator.dart';

class AppTheme {
	AppTheme._();


	// ignore: slash_for_doc_comments
	/********************************
	 * ? Image URLS
	 *********************************/

	static const String landing_image =
			'https://firebasestorage.googleapis.com/v0/b/funrun-dd997.appspot.com/o/logos%2Fsuper_hero_background_2.png?alt=media&token=30790367-3ca9-4792-94ea-64b9de3808cd';



	// ignore: slash_for_doc_comments
	/********************************
	 * ? LOGO Paths
	 *********************************/
	static const String logoSmall = 'assets/logo_small.png';
	static const String logo = 'assets/logo.png';
	static const String logoStack = 'assets/logo_stack.png';


	// ignore: slash_for_doc_comments
	/********************************
	 * ? Placeholder URLS
	 *********************************/


	static const String placeholder =
			'https://firebasestorage.googleapis.com/v0/b/craq-1cbd8.appspot.com/o/profile_placeholder.png?alt=media&token=4278c2b5-9b0a-4e91-8c11-7bd6d3959cf3';
	static const String productPlaceholder =
			'https://firebasestorage.googleapis.com/v0/b/craq-1cbd8.appspot.com/o/empty_image.png?alt=media&token=e4216f30-dc97-40a0-baa0-f42835a8d57b';

	static const String iOS_Devices =
			'https://firebasestorage.googleapis.com/v0/b/funrun-dd997.appspot.com/o/logos%2Fiphone%20and%20ipad.png?alt=media&token=39fa82d9-3f84-4ad0-a1bb-440a7a5352d8';
	// ignore: slash_for_doc_comments
	/********************************
	 * ? Colors
	 *********************************/

	static const Color notWhite = Color(0xFFEDF0F2);
	static const Color nearlyWhite = Color(0xFFFAFAFA);
	static const Color white = Color(0xFFFFFFFF);
	static const Color background = Color(0xFFF2F3F8);
	static const Color background_themed = Color(0xFFfff5f5);
	static const Color nearlyDarkBlue = Color(0xFF2633C5);
	static const Color disabledText = Color(0xff7d7d7d);
	static const Color disabledColor = Color(0xffc5c5c5);
	static const Color darkBackground = Color(0xFF121212);
	static const Color kShrineScrim = Color(0x73442C2E);
	static const Color starColor = Color(0xFFFBC02D);
	static const Color silverColor = Color(0xFFe1e1e1);
	static const Color bronzeColor = Color(0xFFa7824e);
	static const Color nearlyBlack = Color(0xFF213333);
	static const Color grey = Color(0xFF3A5160);

	static const Color secondary = Color(0xFF1a8b9d);
	static const Color secondaryDark = Color(0xFFb49b71);
	static const Color accent = Color(0xFFF05B29);
	static const Color themeColor = Color(0xFFC5D72F);

// ignore: slash_for_doc_comments
	/********************************
	 * ? TextStyles
	 *********************************/



	// ignore: slash_for_doc_comments
	/********************************
	 * ? Border Radius
	 *********************************/




// ignore: slash_for_doc_comments
	/********************************
	 * ? Gradients
	 *********************************/

	static LinearGradient themeGradient = LinearGradient(
			begin: Alignment.topCenter,
			end: Alignment.bottomCenter,
			colors: [
				AppTheme.themeColor.shade500,
				AppTheme.themeColor.shade700
			]);

	static const LinearGradient darkThemeGradient = LinearGradient(
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
			stops: [0.1, 0.8],
			colors: [Color(0xFF1B2F37), Color(0xFF101B20)]);

	static LinearGradient extraLightThemeGradient = LinearGradient(
			begin: Alignment.centerLeft,
			end: Alignment.centerRight,
			colors: [
				AppTheme.themeColor.shade100,
				AppTheme.themeColor.shade200
			]);
	static LinearGradient compGradient = LinearGradient(
			begin: Alignment.centerLeft,
			end: Alignment.centerRight,
			colors: [
				AppTheme.themeColor.compColor.shade500,
				AppTheme.themeColor.compColor.shade700
			]);

	static const LinearGradient darkCardGradient = LinearGradient(
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
			stops: [0.1, 0.8],
			colors: [Color(0xff262626), Colors.black]);

	static const LinearGradient darkGradient = LinearGradient(
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
			stops: [0.1, 0.8],
			colors: [Color(0xFF2B2B2B), Color(0xFF111111)]);

// ignore: slash_for_doc_comments
	/********************************
	 * ? Box Shadows
	 *********************************/

	static List<BoxShadow> twentyFiveRBoxShadow = [
		BoxShadow(blurRadius: 25.50, color: Colors.black.withOpacity(0.46), offset: Offset(0, 4))
	];
	static List<BoxShadow> slightWideShadow = [
		BoxShadow(blurRadius: 45.50, color: AppTheme.themeColor.shade700.withOpacity(0.25), offset: Offset(0, 4))
	];
	static List<BoxShadow> normalShadow = [
		BoxShadow(blurRadius: 4.5, color: Colors.black.withOpacity(0.25), offset: Offset(0, 2))
	];
	static List<BoxShadow> liftedShadow = [
		BoxShadow(blurRadius: 7.5, color: Colors.black.withOpacity(0.35), offset: Offset(0, 4))
	];
}


const   _thin = FontWeight.w100;
const  _extraLight = FontWeight.w200;
const  _light = FontWeight.w300;
const _regular = FontWeight.w400;
const _medium = FontWeight.w500;
const _semiBold = FontWeight.w600;
const _bold = FontWeight.w700;
const _extraBold = FontWeight.w800;
const _black = FontWeight.w900;

TextStyle get h1 =>  GoogleFonts.rubikMonoOne(
		fontSize: 73,
		fontWeight: _light,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: -1.5));

TextStyle get h2 =>  GoogleFonts.rubikMonoOne(
		fontSize: 46,
		fontWeight: _light,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: -0.5));

TextStyle get h3 =>  GoogleFonts.rubikMonoOne(
		fontSize: 36,
		fontWeight: _regular,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 0.0));

TextStyle get h4 =>  GoogleFonts.rubikMonoOne(
		fontSize: 26,
		fontWeight: _regular,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 0.25));

TextStyle get h5 =>  GoogleFonts.rubikMonoOne(
		fontSize: 22,
		fontWeight: _regular,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 0));

TextStyle get h6 =>  GoogleFonts.rubik(
		fontSize: 18,
		fontWeight: _bold,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 0.15));

TextStyle get b1 => GoogleFonts.rubik(
		fontSize: 16,
		fontWeight: _regular,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 0.5));

TextStyle get b2 => GoogleFonts.rubik(
		fontSize: 14,
		fontWeight: _regular,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 0.25));

TextStyle get s1 => GoogleFonts.rubik(
		fontSize: 16,
		fontWeight: _regular,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 0.15));

TextStyle get s2 => GoogleFonts.rubik(
		fontSize: 14,
		fontWeight: _medium,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 0.1));

TextStyle get btn => GoogleFonts.rubik(
		fontSize: 14,
		fontWeight: _medium,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 1.25));

TextStyle  get cptn =>GoogleFonts.rubik(
		fontSize: 12,
		fontWeight: _regular,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 0.4));

TextStyle get over => GoogleFonts.rubik(
		fontSize: 10,
		fontWeight: _regular,
		textStyle: TextStyle(color: nearlyBlack, letterSpacing: 1.5));

ThemeModel get themeModel =>	ThemeModel(
	stream: _themeStream, themeColor: AppTheme.themeColor, accentColor: AppTheme.accent,
);
Stream<ThemeProviderModel> get _themeStream => Firestore.instance
		.collection('Theme')
		.document('theme')
		.snapshots()
		.map((event) => ThemeProviderModel.fromJson(event.data));




iconTheme({Color primary,Color primaryAccent,Color secondary, Color secondaryAccent}) => SchemeIconColor(
		primaryColor: primary ?? AppTheme.secondaryDark,
		primaryAccent: primaryAccent ?? Colors.white.withOpacity(.40),
		secondary: secondary ?? theme.cardColor.textColor.withOpacity(0.70),
		secondaryAccent: secondaryAccent ?? theme.cardColor.textColor.withOpacity(0.40));

SchemeTheme theme = locator<SchemeTheme>();
