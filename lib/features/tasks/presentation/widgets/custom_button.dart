import 'package:flutter/material.dart';

import '../../../../core/utils/color_constants.dart';
import '../../../../core/utils/size_utils.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.margin,
    this.onTap,
    this.bgColor,
    this.textColor,
    this.width,
    this.height,
    this.isLoading = false,
    this.text,
    this.prefixWidget,
    this.suffixWidget,
    required String imagePath,
  });

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  bool isLoading;
  Color? bgColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: isLoading
            ? null
            : () {
                WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                if (onTap != null) {
                  onTap!();
                }
              },
        style: _buildTextButtonStyle(),
        child: isLoading
            ? const SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              )
            : _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Stack(
        children: [
          Container(
              alignment: Alignment.centerRight,
              child: prefixWidget ?? const SizedBox()),
          Align(
            alignment: Alignment.center,
            child: Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
          ),
          Container(
              alignment: Alignment.centerRight,
              child: suffixWidget ?? const SizedBox())
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        getHorizontalSize(width ?? double.infinity),
        getVerticalSize(height ?? 0),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll13:
        return getPadding(
          all: 13,
        );
      case ButtonPadding.PaddingAll4:
        return getPadding(
          all: 4,
        );
      case ButtonPadding.PaddingLR30:
        return getPadding(left: 30, right: 30);
      case ButtonPadding.PaddingT4:
        return getPadding(
          left: 4,
          top: 4,
          bottom: 4,
        );
      case ButtonPadding.PaddingT7:
        return getPadding(
          left: 7,
          top: 7,
          bottom: 7,
        );
      case ButtonPadding.PaddingAll18:
        return getPadding(
          all: 18,
        );
      default:
        return getPadding(
          all: 8,
        );
    }
  }

  _setColor() {
    if (bgColor != null) return bgColor;
    switch (variant) {
      case ButtonVariant.FillRedA70001:
        return ColorConstant.redA70001;
      case ButtonVariant.FillLightgreen800:
        return ColorConstant.green800;
      case ButtonVariant.FillBluegray100:
        return ColorConstant.blueGray100;
      case ButtonVariant.FillYellow20002:
        return ColorConstant.yellow20002;
      case ButtonVariant.FillLime900:
        return ColorConstant.lime900;
      case ButtonVariant.FillOrangeA10002:
        return ColorConstant.orangeA10002;
      case ButtonVariant.OutlineBlack90033:
        return ColorConstant.lime900;
      case ButtonVariant.OutlineBlack900:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineBlack90033_1:
        return ColorConstant.amber600;
      case ButtonVariant.OutlineBlack90033_2:
        return ColorConstant.whiteA700;
      default:
        return ColorConstant.amber600;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineBlack900:
        return BorderSide(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            0.25,
          ),
        );
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack90033:
        return ColorConstant.black90033;
      case ButtonVariant.OutlineBlack90033_1:
        return ColorConstant.black90033;
      case ButtonVariant.OutlineBlack90033_2:
        return ColorConstant.black90033;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case ButtonShape.CircleBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case ButtonShape.CustomBorderTL10:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
      case ButtonShape.CustomBorderBL10:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
      case ButtonShape.CircleBorder24:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
      case ButtonShape.CustomBorderLR10:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.RobotoRomanSemiBold40:
        return TextStyle(
          color: textColor ?? ColorConstant.black900,
          fontSize: getFontSize(
            40,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.RobotoRomanSemiBold15:
        return TextStyle(
          color: textColor ?? ColorConstant.black900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.RobotoRomanSemiBold15WhiteA700:
        return TextStyle(
          color: textColor ?? ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.RobotoRomanSemiBold24WhiteA700:
        return TextStyle(
          color: textColor ?? ColorConstant.black900,
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.RobotoRomanSemiBold24:
        return TextStyle(
          color: textColor ?? ColorConstant.black900,
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.RobotoRomanSemiBold16:
        return TextStyle(
          color: textColor ?? ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.RobotoRomanSemiBold24WhiteA700:
        return TextStyle(
          color: textColor ?? ColorConstant.whiteA700,
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.RobotoRomanSemiBold14:
        return TextStyle(
          color: textColor ?? ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.RobotoRomanSemiBold20:
        return TextStyle(
          color: textColor ?? ColorConstant.black900,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: textColor ?? ColorConstant.black900,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder5,
  RoundedBorder10,
  CircleBorder20,
  CustomBorderTL10,
  CustomBorderBL10,
  CircleBorder24,
  CustomBorderLR10,
  CircleBorder36,
}

enum ButtonPadding {
  PaddingAll8,
  PaddingAll13,
  PaddingAll4,
  PaddingT4,
  PaddingT7,
  PaddingAll18,
  PaddingAll7,
  PaddingAll11,
  PaddingAll20,
  PaddingLR30,
}

enum ButtonVariant {
  FillAmber600,
  FillBluegray100,
  FillYellow20002,
  FillLime900,
  OutlineBlack90033,
  FillOrangeA10002,
  OutlineBlack900,
  OutlineBlack90033_1,
  OutlineBlack90033_2,
  FillOrangeA100,
  FillLightgreen800,
  FillRedA70001,
}

enum ButtonFontStyle {
  RobotoRomanRegular20,
  RobotoRomanSemiBold40,
  RobotoRomanSemiBold24,
  RobotoRomanSemiBold16,
  RobotoRomanSemiBold24WhiteA700,
  RobotoRomanSemiBold14,
  RobotoRomanSemiBold20,
  RobotoRomanRegular20Black900,
  RobotoRomanRegular24,
  RobotoRomanSemiBold15,
  RobotoRomanSemiBold15WhiteA700,
}
