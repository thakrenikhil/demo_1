import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/color_constants.dart';
import '../../../../core/utils/size_utils.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.readOnly = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.textCapitalization = TextCapitalization.sentences,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.textStyle,
      this.minLines,
      this.onChanged,
      this.maxLength,
      this.inputFormatters,
      this.inputType,
      this.errorText,
      this.validator});

  int? maxLines;
  int? minLines;
  int? maxLength;
  String? errorText;
  bool readOnly;
  TextInputType? inputType;
  List<TextInputFormatter>? inputFormatters;

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;
  TextCapitalization textCapitalization;
  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;
  TextStyle? textStyle;
  ValueChanged<String>? onChanged;
  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: getHorizontalSize(width ?? double.maxFinite),
      alignment: alignment,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        style: textStyle ?? _setFontStyle(),
        textCapitalization: textCapitalization,
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: inputType,
        maxLines: maxLines ?? minLines ?? 1,
        minLines: minLines,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: textStyle ?? _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      errorText: errorText,
      errorStyle: TextStyle(
          color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.w400),
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      counterText: "",
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.RobotoRomanSemiBold16:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.RobotoRomanRegular20:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.RobotoRomanRegular20WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.RobotoRomanSemiBold14:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.ErasITCBold14:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Eras Bold ITC',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.black90099,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case TextFormFieldShape.RoundedBorder5:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
      case TextFormFieldShape.CustomBorderTL10:
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
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.FillWhiteA700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillAmber600:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillGreen800:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBlack900:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.black900,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineAmber600:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.amber600,
            width: 2,
          ),
        );
      case TextFormFieldVariant.OutlineAmberA700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.amberA700,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineBlack900_1:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.black900,
            width: 2,
          ),
        );
      case TextFormFieldVariant.OutlineAmber600_1:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.amber600,
            width: 2,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.FillAmber600:
        return ColorConstant.amber600;
      case TextFormFieldVariant.FillGreen800:
        return ColorConstant.green800;
      case TextFormFieldVariant.OutlineBlack900:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineAmber600:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineAmberA700:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineBlack900_1:
        return ColorConstant.amber600;
      case TextFormFieldVariant.OutlineAmber600_1:
        return ColorConstant.whiteA700;
      default:
        return ColorConstant.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.FillWhiteA700:
        return true;
      case TextFormFieldVariant.FillAmber600:
        return true;
      case TextFormFieldVariant.FillGreen800:
        return true;
      case TextFormFieldVariant.OutlineBlack900:
        return true;
      case TextFormFieldVariant.OutlineAmber600:
        return true;
      case TextFormFieldVariant.OutlineAmberA700:
        return true;
      case TextFormFieldVariant.OutlineBlack900_1:
        return true;
      case TextFormFieldVariant.OutlineAmber600_1:
        return true;
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT16:
        return getPadding(
          left: 12,
          top: 16,
          right: 12,
          bottom: 16,
        );
      case TextFormFieldPadding.PaddingT15:
        return getPadding(
          left: 12,
          top: 15,
          right: 12,
          bottom: 15,
        );
      case TextFormFieldPadding.PaddingT14:
        return getPadding(
          left: 12,
          top: 14,
          right: 12,
          bottom: 14,
        );
      case TextFormFieldPadding.PaddingT16_1:
        return getPadding(
          top: 16,
          right: 12,
          bottom: 16,
        );
      case TextFormFieldPadding.PaddingT16_2:
        return getPadding(
          left: 16,
          top: 16,
          bottom: 16,
        );
      case TextFormFieldPadding.PaddingAll0:
        return getPadding(
          all: 0,
        );
      case TextFormFieldPadding.PaddingAll4:
        return getPadding(
          all: 4,
        );
      case TextFormFieldPadding.PaddingT7:
        return getPadding(
          left: 7,
          top: 7,
          bottom: 7,
        );
      case TextFormFieldPadding.PaddingT16_3:
        return getPadding(
          top: 16,
          right: 16,
          bottom: 16,
        );
      case TextFormFieldPadding.PaddingT11:
        return getPadding(
          left: 11,
          top: 11,
          bottom: 11,
        );
      case TextFormFieldPadding.PaddingAll13:
        return getPadding(
          all: 13,
        );
      case TextFormFieldPadding.PaddingAll10:
        return getPadding(
          all: 10,
        );
      default:
        return getPadding(
          all: 16,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder20,
  RoundedBorder10,
  RoundedBorder5,
  CustomBorderTL10,
}

enum TextFormFieldPadding {
  PaddingT16,
  PaddingT15,
  PaddingT14,
  PaddingT16_1,
  PaddingAll16,
  PaddingT16_2,
  PaddingAll4,
  PaddingT7,
  PaddingT16_3,
  PaddingT11,
  PaddingAll13,
  PaddingAll10,
  PaddingAll0,
}

enum TextFormFieldVariant {
  None,
  OutlineBlack90033,
  FillWhiteA700,
  FillAmber600,
  FillGreen800,
  OutlineBlack900,
  OutlineAmber600,
  OutlineAmberA700,
  OutlineBlack900_1,
  OutlineAmber600_1,
}

enum TextFormFieldFontStyle {
  RobotoRomanMedium14,
  RobotoRomanSemiBold16,
  RobotoRomanRegular20,
  RobotoRomanRegular20WhiteA700,
  RobotoRomanSemiBold14,
  ErasITCBold14,
}
