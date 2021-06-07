import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late double safeIsMobile = 1.0;
  static late double fullScreenWidth;
  static late double fullScreenHeight;

  static final SizeConfig _instance = SizeConfig._internal();

  factory SizeConfig() => _instance;

  SizeConfig._internal();

  void init(BuildContext context) {
    safeIsMobile = kIsWeb ? 0.8 : 1.0;
    _mediaQueryData = MediaQuery.of(context);
    fullScreenHeight = _mediaQueryData.size.height;
    fullScreenWidth = _mediaQueryData.size.width;
    screenWidth = _mediaQueryData.size.width * safeIsMobile;
    screenHeight = _mediaQueryData.size.height * safeIsMobile;
    blockSizeHorizontal = screenWidth / 100 * safeIsMobile;
    blockSizeVertical = screenHeight / 100 * safeIsMobile;

    _safeAreaHorizontal = (_mediaQueryData.padding.left + _mediaQueryData.padding.right) * safeIsMobile;
    _safeAreaVertical = (_mediaQueryData.padding.top + _mediaQueryData.padding.bottom) * safeIsMobile;
    safeBlockHorizontal = ((screenWidth - _safeAreaHorizontal) / 100) * safeIsMobile;
    safeBlockVertical = ((screenHeight - _safeAreaVertical) / 100) * safeIsMobile;
    safeBlockHorizontal = safeBlockHorizontal > 4.0? 4.0:safeBlockHorizontal;
    safeBlockVertical = safeBlockVertical > 8.0? 8.0:safeBlockVertical;
  }


  static double get spacing_mini_vertical => safeBlockVertical * safeIsMobile;

  static double get spacing_small_vertical => safeBlockVertical * 2 * safeIsMobile;

  static double get spacing_small_plus_vertical => safeBlockVertical * 2.5 * safeIsMobile;

  static double get spacing_medium_vertical => safeBlockVertical * 3 * safeIsMobile;

  static double get spacing_normal_vertical => safeBlockVertical * 4 * safeIsMobile;

  static double get spacing_large_vertical => safeBlockVertical * 7 * safeIsMobile;

  static double get spacing_extra_vertical => safeBlockVertical * 9 * safeIsMobile;

  static double get spacing_small_horizontal => safeBlockHorizontal * 2 * safeIsMobile;

  static double get spacing_small_plus_horizontal => safeBlockHorizontal * 2.5 * safeIsMobile;

  static double get spacing_medium_horizontal => safeBlockVertical * 3 * safeIsMobile;

  static double get spacing_normal_horizontal => safeBlockVertical * 4 * safeIsMobile;

  static double get spacing_large_horizontal => safeBlockVertical * 7 * safeIsMobile;

  static double get spacing_extra_horizontal => safeBlockVertical * 9 * safeIsMobile;

  static double get font_huge => safeBlockHorizontal * 10 * safeIsMobile;

  static double get font_extra => safeBlockHorizontal * 7 * safeIsMobile;

  static double get font_large => safeBlockHorizontal * 6 * safeIsMobile;

  static double get font_medium_plus => safeBlockHorizontal * 5.25 * safeIsMobile;

  static double get font_medium => safeBlockHorizontal * 4.5 * safeIsMobile;

  static double get font_small => safeBlockHorizontal * 3 * safeIsMobile;

  static double get font_small_plus => safeBlockHorizontal * 3.5 * safeIsMobile;

  static double get font_mini => safeBlockHorizontal * 2 * safeIsMobile;

  static double get font_main_screen => safeBlockHorizontal * 5 * safeIsMobile;
}
