import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/color_constants.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ColorConstant.appGradient,

      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/empty-folder.json',
            width: 250,
          ),
          const Text(
            "No tasks yet",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
