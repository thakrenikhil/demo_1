
// ignore: must_be_immutable
import 'package:clean_todo/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import 'color_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {required this.height,
        this.styleType,
        this.leadingWidth,
        this.leading,
        this.title,
        this.centerTitle,
        this.actions});

  double height;

  Style? styleType;

  double? leadingWidth;

  Widget? leading;

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
    size.width,
    height,
  );
  _getStyle() {
    switch (styleType) {
      case Style.bgFillYellow200:
        return Container(
          height: getVerticalSize(
            60.00,
          ),
          width: size.width,
          decoration: BoxDecoration(
            color: ColorConstant.yellow200,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFillYellow200,
}
