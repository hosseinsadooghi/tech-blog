/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/icons/avatar.png');

  /// File path: assets/icons/hashtag.png
  AssetGenImage get hashtag => const AssetGenImage('assets/icons/hashtag.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/mic.png
  AssetGenImage get mic => const AssetGenImage('assets/icons/mic.png');

  /// File path: assets/icons/pen.png
  AssetGenImage get pen => const AssetGenImage('assets/icons/pen.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// File path: assets/icons/write.png
  AssetGenImage get write => const AssetGenImage('assets/icons/write.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [avatar, hashtag, home, mic, pen, user, write];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/podcastsPicture1.png
  AssetGenImage get podcastsPicture1 =>
      const AssetGenImage('assets/images/podcastsPicture1.png');

  /// File path: assets/images/podcastsPicture2.png
  AssetGenImage get podcastsPicture2 =>
      const AssetGenImage('assets/images/podcastsPicture2.png');

  /// File path: assets/images/podcastsPicture3.png
  AssetGenImage get podcastsPicture3 =>
      const AssetGenImage('assets/images/podcastsPicture3.png');

  /// File path: assets/images/podcastsPicture4.png
  AssetGenImage get podcastsPicture4 =>
      const AssetGenImage('assets/images/podcastsPicture4.png');

  /// File path: assets/images/programming.png
  AssetGenImage get programming =>
      const AssetGenImage('assets/images/programming.png');

  /// File path: assets/images/reg_bot.svg
  SvgGenImage get regBot => const SvgGenImage('assets/images/reg_bot.svg');

  /// List of all assets
  List<dynamic> get values => [
        logo,
        podcastsPicture1,
        podcastsPicture2,
        podcastsPicture3,
        podcastsPicture4,
        programming,
        regBot
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
